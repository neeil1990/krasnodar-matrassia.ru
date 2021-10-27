<?PHP

/**
 * Simpla CMS
 *
 * @copyright 	2011 Denis Pikusov
 * @link 		http://simplacms.ru
 * @author 		Denis Pikusov
 *
 * Этот класс использует шаблон product.tpl
 *
 */

require_once('View.php');


class ProductView extends View
{

	function fetch()
	{
		$product_url = $this->request->get('product_url', 'string');
		
		if(empty($product_url))
			return false;

		// Выбираем товар из базы
		$product = $this->products->get_product((string)$product_url);
		if(empty($product) || (!$product->visible && empty($_SESSION['admin'])))
			return false;
		
		$product->images = $this->products->get_images(array('product_id'=>$product->id));
		foreach($product->images as $key => &$image){
			if(!file_exists($_SERVER['DOCUMENT_ROOT']."/files/originals/".$image->filename)){
				$image->filename = "default.png";
			}
		}
		$product->image = reset($product->images);

		$variants = array();
		foreach($this->variants->get_variants(array('product_id'=>$product->id, 'in_stock'=>true)) as $v)
			$variants[$v->id] = $v;
		
		$product->variants = $variants;
		
		// Вариант по умолчанию
		if(($v_id = $this->request->get('variant', 'integer'))>0 && isset($variants[$v_id]))
			$product->variant = $variants[$v_id];
		else
			$product->variant = reset($variants);
					
		$product->features = $this->features->get_product_options(array('product_id'=>$product->id));
	
		// Автозаполнение имени для формы комментария
		if(!empty($this->user))
			$this->design->assign('comment_name', $this->user->name);

		// Принимаем комментарий
		if ($this->request->method('post') && $this->request->post('comment'))
		{
			$comment = new stdClass;
			$comment->rating = $this->request->post('rating');
			$comment->name = $this->request->post('name');
			$comment->pluses_text = $this->request->post('pluses_text');
			$comment->minuses_text = $this->request->post('minuses_text');
			$comment->text = $this->request->post('text');
			$comment->image = $this->request->files('image');

			$g_recaptcha_response = $this->request->post('g-recaptcha-response');

			// Передадим комментарий обратно в шаблон - при ошибке нужно будет заполнить форму
			$this->design->assign('comment_text', $comment->text);
			$this->design->assign('comment_name', $comment->name);

			$curl = curl_init();
			curl_setopt($curl, CURLOPT_URL, "https://www.google.com/recaptcha/api/siteverify?secret=6LdEGpkUAAAAAA_rSBxPEwOUVBJtMY67_ztRz91A&response=$g_recaptcha_response&remoteip=$_SERVER[REMOTE_ADDR]");
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($curl, CURLOPT_TIMEOUT, 15);
			curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36");
			$curlRecaptcha = curl_exec($curl);
			curl_close($curl);

			// Проверяем заполнение формы
			if(isset(json_decode($curlRecaptcha)->success) && json_decode($curlRecaptcha)->success == false)
			{
				$this->design->assign('error', 'empty_captcha');
			}
			elseif (empty($comment->name))
			{
				$this->design->assign('error', 'empty_name');
			}
			elseif (empty($comment->text))
			{
				$this->design->assign('error', 'empty_comment');
			}
			else
			{
				// Создаем комментарий
				$comment->object_id = $product->id;
				$comment->type      = 'product';
				$comment->ip        = $_SERVER['REMOTE_ADDR'];
				
				// Если были одобренные комментарии от текущего ip, одобряем сразу
				$this->db->query("SELECT 1 FROM __comments WHERE approved=1 AND ip=? LIMIT 1", $comment->ip);
				if($this->db->num_rows()>0)
					$comment->approved = 1;

				if(isset($comment->image['name']) && $comment->image['name'])
					$comment->image = $this->image->upload_image($comment->image['tmp_name'], $comment->image['name']);
				else
					unset($comment->image);

				// Добавляем комментарий в базу
				$comment_id = $this->comments->add_comment($comment);
				
				// Отправляем email
				$this->notify->email_comment_admin($comment_id);				

				// Приберем сохраненную капчу, иначе можно отключить загрузку рисунков и постить старую
				header('location: '.$_SERVER['REQUEST_URI'].'#comment_'.$comment_id);
			}			
		}
				
		// Связанные товары
		$related_ids = array();
		$related_products = array();
		foreach($this->products->get_related_products($product->id) as $p)
		{
			$related_ids[] = $p->related_id;
			$related_products[$p->related_id] = null;
		}
		if(!empty($related_ids))
		{
			foreach($this->products->get_products(array('id'=>$related_ids, 'in_stock'=>1, 'visible'=>1)) as $p)
				$related_products[$p->id] = $p;
			
			$related_products_images = $this->products->get_images(array('product_id'=>array_keys($related_products)));
			foreach($related_products_images as $related_product_image)
				if(isset($related_products[$related_product_image->product_id]))
					$related_products[$related_product_image->product_id]->images[] = $related_product_image;
			$related_products_variants = $this->variants->get_variants(array('product_id'=>array_keys($related_products), 'in_stock'=>1));
			foreach($related_products_variants as $related_product_variant)
			{
				if(isset($related_products[$related_product_variant->product_id]))
				{
					$related_products[$related_product_variant->product_id]->variants[] = $related_product_variant;
				}
			}
			foreach($related_products as $id=>$r)
			{
				if(is_object($r))
				{
					$r->image = &$r->images[0];
					$r->variant = &$r->variants[0];
				}
				else
				{
					unset($related_products[$id]);
				}
			}
			$this->design->assign('related_products', $related_products);
		}

		// Отзывы о товаре
		$comments = $this->comments->get_comments(array('type'=>'product', 'object_id'=>$product->id, 'approved'=>1, 'ip'=>$_SERVER['REMOTE_ADDR']));

		if(count($comments) > 0){
			$ratings = array_count_values(array_column($comments, 'rating'));
			foreach($ratings as $star => &$count){
				$count = $star*$count;
			}
			$middle_rating = round(array_sum($ratings) / array_sum(array_count_values(array_column($comments, 'rating'))));
		}

		// Соседние товары
		$this->design->assign('next_product', $this->products->get_next_product($product->id));
		$this->design->assign('prev_product', $this->products->get_prev_product($product->id));

		// И передаем его в шаблон
		$this->design->assign('product', $product);
		$this->design->assign('middle_rating', $middle_rating);
		$this->design->assign('comments', $comments);

		// Категория и бренд товара
		$product->categories = $this->categories->get_categories(array('product_id'=>$product->id));
		$this->design->assign('brand', $this->brands->get_brand(intval($product->brand_id)));		
		$this->design->assign('category', reset($product->categories));

		// Добавление в историю просмотров товаров
		$max_visited_products = 100; // Максимальное число хранимых товаров в истории
		$expire = time()+60*60*24*30; // Время жизни - 30 дней
		if(!empty($_COOKIE['browsed_products']))
		{
			$browsed_products = explode(',', $_COOKIE['browsed_products']);
			// Удалим текущий товар, если он был
			if(($exists = array_search($product->id, $browsed_products)) !== false)
				unset($browsed_products[$exists]);
		}
		// Добавим текущий товар
		$browsed_products[] = $product->id;
		$cookie_val = implode(',', array_slice($browsed_products, -$max_visited_products, $max_visited_products));
		setcookie("browsed_products", $cookie_val, $expire, "/");

		if(empty($product->meta_title) && is_array($product->categories)){
            $product->price = $this->money->convert(current($product->variants)->price);
            $product->variants_name = current($product->variants)->name;

		    $meta_title_product = current($product->categories)->meta_title_product;
            preg_match_all("/{(.*?)}/",$meta_title_product,$title_temp,PREG_PATTERN_ORDER);
		    foreach(current($title_temp) as $k => $temp){
		        if($property = end($title_temp)[$k]){
		            if(isset($product->$property) && !empty($product->$property))
                    $meta_title_product = str_replace($temp,$product->$property,$meta_title_product);
                }
            }
            $product->meta_title = $meta_title_product;
        }

		$this->design->assign('meta_title', $product->meta_title);
		$this->design->assign('meta_keywords', $product->meta_keywords);
		$this->design->assign('meta_description', $product->meta_description);
		
		return $this->design->fetch('product.tpl');
	}
	


}
