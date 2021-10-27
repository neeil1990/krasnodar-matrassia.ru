{* Страница входа пользователя *}

{* Канонический адрес страницы *}
{$canonical="/user/login" scope=parent}

{$meta_title = "Вход" scope=parent}
   
<ul class="breadcrumb-navigation">
	<li><a title="Главная" href="/">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a title="Сравнение товаров" href="/user/login" class="last">Вход</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>   
   
<h1>Вход</h1>

{if $error}
<div class="message_error">
	{if $error == 'login_incorrect'}Неверный логин или пароль
	{elseif $error == 'user_disabled'}Ваш аккаунт еще не активирован.
	{else}{$error}{/if}
</div>
{/if}

<form class="form login_form" method="post">
	<label>Email</label>
	<input class="textinput40 back1"  type="text" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}" maxlength="255" />

    <label>Пароль (<a href="user/password_remind">напомнить</a>)</label>
    <input class="textinput40 back1"  type="password" name="password" data-format=".+" data-notice="Введите пароль" value="" />

	<input type="submit" class="multimage_bottom smartlink_set btn1 apply" name="login" value="Войти">
</form>