{* Страница входа пользователя *}

{* Канонический адрес страницы *}
{$canonical="/user/login" scope=parent}

{$meta_title = "Вход" scope=parent}

<ul id="breadcrumbs"> 
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>Авторизация</span></li>
</ul>
<div id="authForm">
	<div id="pseudoTabs">
		<h1 class="tabSelector">Авторизация</h1>
		<noindex>
			<a class="tabSelector inactive" rel="nofollow" href="/user/register">Регистрация</a>
		</noindex>
	</div>
<p>
{if $error}
<div class="message_error">
	{if $error == 'login_incorrect'}Неверный логин или пароль
	{elseif $error == 'user_disabled'}Ваш аккаунт еще не активирован.
	{else}{$error}{/if}
</div>
{/if}
</p>
<form class="form login_form" method="post">
	<table class="bx-auth-table">
	<tbody>
		<tr>
			<td class="bx-auth-label">Логин:</td>
			<td><input type="text" name="email"  class="bx-auth-input" data-format="email" data-notice="Введите email" value="{$email|escape}" maxlength="255" /></td>
		</tr>
		<tr>
			<td class="bx-auth-label">Пароль:</td>
			<td><input type="password" class="bx-auth-input" name="password" data-format=".+" data-notice="Введите пароль" value="" /></td>
		</tr>
		<tr>
			<td></td>
			<td class="authorize-submit-cell"><input type="submit" class="submit" value="Войти" name="login"></td>
		</tr>
		</tbody>
	</table>
	<noindex>
		<p id="forgot">
			<a rel="nofollow" href="user/password_remind">Забыли свой пароль?</a>
		</p>
	</noindex>
</form>
</div>
<link rel="stylesheet" type="text/css" href="design/{$settings->theme|escape}/css/login.css">