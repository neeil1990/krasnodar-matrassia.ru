<?PHP

/**
 * Simpla CMS
 *
 * @copyright 	2009 Denis Pikusov
 * @link 		http://simp.la
 * @author 		Denis Pikusov
 *
 * Отображение статей на сайте
 * Этот класс использует шаблоны articles.tpl и article.tpl
 *
 */
 
require_once('View.php');

class UserView extends View
{
	function fetch()
	{
		if(empty($this->user))
		{
			header('Location: '.$this->config->root_url.'/user/login');
			exit();
		}
	
		if($this->request->method('post') && $this->request->post('name'))
		{
			$name			= $this->request->post('name');
			$email			= $this->request->post('email');
			$password		= $this->request->post('password');
			
			$this->design->assign('name', $name);
			$this->design->assign('email', $email);
			
			$this->db->query('SELECT count(*) as count FROM __users WHERE email=? AND id!=?', $email, $this->user->id);
			$user_exists = $this->db->result('count');

			if($user_exists)
				$this->design->assign('error', 'user_exists');
			elseif(empty($name))
				$this->design->assign('error', 'empty_name');
			elseif(empty($email))
				$this->design->assign('error', 'empty_email');
			elseif($user_id = $this->users->update_user($this->user->id, array('name'=>$name, 'email'=>$email)))
			{
				$this->user = $this->users->get_user(intval($user_id));
				$this->design->assign('name', $this->user->name);
				$this->design->assign('user', $this->user);
				$this->design->assign('email', $this->user->email);

                // Отсылаем данные о пользователе в RetailCRM
                if ($this->retail->isOnlineIntegration() && $arUserData = $this->retail->getUserRetailData($user_id)) {
                    $this->retail->request('customersEdit', $arUserData);
                }
			}
			else
				$this->design->assign('error', 'unknown error');
			
			if(!empty($password))
			{
				$this->users->update_user($this->user->id, array('password'=>$password));
			}
	
		}
		else
		{
			// Передаем в шаблон
			$this->design->assign('name', $this->user->name);
			$this->design->assign('email', $this->user->email);		
		}
	
		$orders = $this->orders->get_orders(array('user_id'=>$this->user->id));
		$this->design->assign('orders', $orders);
		
		$this->design->assign('meta_title', $this->user->name);
		$body = $this->design->fetch('user.tpl');
		
		return $body;
	}
}
