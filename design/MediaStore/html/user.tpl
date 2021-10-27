{* Шаблон страницы зарегистрированного пользователя *}

<ul class="breadcrumb-navigation">
	<li><a title="Главная" href="/">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a title="Сравнение товаров" href="/user" class="last">{$user->name|escape}</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>

<h1>{$user->name|escape}</h1>

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
	<label>Имя</label>
	<input data-format=".+" data-notice="Введите имя" value="{$name|escape}" name="name" maxlength="255" type="text"/>
 
	<label>Email</label>
	<input data-format="email" data-notice="Введите email" value="{$email|escape}" name="email" maxlength="255" type="text"/>
	
	<label><a href='#' onclick="$('#password').show();return false;">Изменить пароль</a></label>
	<input id="password" value="" name="password" type="password" style="display:none;"/>
	<input type="submit" class="multimage_bottom smartlink_set btn1 apply" value="Сохранить">
</form>

{if $orders}
<p></p>
<h2>Ваши заказы</h2>
<ul id="orders_history">
{foreach name=orders item=order from=$orders}
	<li>
	{$order->date|date} <a href='order/{$order->url}'>Заказ №{$order->id}</a>
	{if $order->paid == 1}оплачен,{/if} 
	{if $order->status == 0}ждет обработки{elseif $order->status == 1}в обработке{elseif $order->status == 2}выполнен{/if}
	</li>
{/foreach}
</ul>
{/if}