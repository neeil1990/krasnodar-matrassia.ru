
<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>Личный кабинет</span></li>
</ul>						

<h1>{$user->name|escape}</h1>
 <div id="mainProfile">
	<span class="heading">Персональные данные</span>
	{if $error}
		<div class="message_error">
			{if $error == 'empty_name'}Введите имя
			{elseif $error == 'empty_email'}Введите email
			{elseif $error == 'empty_password'}Введите пароль
			{elseif $error == 'user_exists'}Пользователь с таким email уже зарегистрирован
			{else}{$error}{/if}
		</div>
	{/if}
	<form class="form" method="post">
		<table class="profileTable">
			<tbody>
				<tr>
					<td class="left">
						<ul class="profileSettings">
							<li>
								<label>Имя</label>
								<input data-format=".+" data-notice="Введите имя" value="{$name|escape}" class="inputTel" name="name" maxlength="255" type="text"/>
								<label>Email</label>
								<input data-format="email" data-notice="Введите email" class="inputTel"  value="{$email|escape}" name="email" maxlength="255" type="text"/>
								 <span class="heading"><a href='#' onclick="$('#password').show();return false;">Изменить пароль</a></span>
								<input id="password" class="inputTel"  value="" name="password" type="password" style="display:none;"/>
								<input type="submit" class="submit" value="Сохранить">
							</li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	{if $orders}
<p></p>
<h2>Ваши заказы</h2>
<ul id="orders_history">
{foreach $orders as $order}
	<li>
	{$order->date|date} <a href='order/{$order->url}'>Заказ №{$order->id}</a>
	{if $order->paid == 1}оплачен,{/if} 
	{if $order->status == 0}ждет обработки{elseif $order->status == 1}в обработке{elseif $order->status == 2}выполнен{/if}
	</li>
{/foreach}
</ul>
{/if}
</div>
<link rel="stylesheet" type="text/css" href="design/{$settings->theme|escape}/css/user.css">
	