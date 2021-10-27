{* Письмо пользователю для восстановления пароля *}

{* Канонический адрес страницы *}
{$canonical="/user/password_remind" scope=parent}

<ul class="breadcrumb-navigation">
	<li><a title="Главная" href="/">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a title="Сравнение товаров" href="user/password_remind" class="last">Напоминание пароля</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>  


{if $email_sent}
<h1>Вам отправлено письмо</h1>

<p>На {$email|escape} отправлено письмо для восстановления пароля.</p>
{else}
<h1>Напоминание пароля</h1>

{if $error}
<div class="message_error">
	{if $error == 'user_not_found'}Пользователь не найден
	{else}{$error}{/if}
</div>
{/if}

<form class="form" method="post">
	<label>Введите email, который вы указывали при регистрации</label>
	<input type="text"  class="textinput40 back1" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}"  maxlength="255"/>
	<input type="submit" class="multimage_bottom smartlink_set btn1 apply" value="Вспомнить" />
</form>
{/if}