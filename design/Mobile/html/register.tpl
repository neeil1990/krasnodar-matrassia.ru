{* Страница регистрации *}

{* Канонический адрес страницы *}
{$canonical="/user/register" scope=parent}

{$meta_title = "Регистрация" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>Авторизация</span></li>
</ul>						

<div id="register">
	<div id="pseudoTabs">
		<noindex>	
			<a class="tabSelector inactive" rel="nofollow" href="user/login">Вход</a>
		</noindex>
		<h1 class="tabSelector">Регистрация</h1>
	</div>
	
	{if $error}
	<div class="message_error">
		{if $error == 'empty_name'}Введите имя
		{elseif $error == 'empty_email'}Введите email
		{elseif $error == 'empty_password'}Введите пароль
		{elseif $error == 'user_exists'}Пользователь с таким email уже зарегистрирован
		{elseif $error == 'captcha'}Неверно введена капча
		{else}{$error}{/if}
	</div>
	{/if}	
	
	<noindex>
		<form class="form register_form" method="post">
			<table class="data-table bx-registration-table">
				<tbody>
					<tr>
						<td><span class="starrequired">*</span>Имя:</td>
						<td><input type="text" class="bx-auth-input" name="name" data-format=".+" data-notice="Введите имя" value="{$name|escape}" maxlength="255" /></td>
					</tr>
					<tr>
						<td><span class="starrequired">*</span>E-Mail:</td>
						<td><input type="text" class="bx-auth-input" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}" maxlength="255" /></td>
					</tr>
					<tr>
						<td><span class="starrequired">*</span>Пароль:</td>
						<td><input type="password" name="password" data-format=".+" data-notice="Введите пароль" value="" /></td>
					</tr>
					<tr>
						<td colspan="2"><b>Защита от автоматической регистрации</b></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<img src="captcha/image.php?{math equation='rand(10,10000)'}"/>
						</td>
					</tr>
					<tr>
						<td><span class="starrequired">*</span>Введите слово на картинке:</td>
						<td><input class="input_captcha" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/></td>
					</tr>
						</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td><input type="submit" class="submit" value="Регистрация" name="register"></td>
					</tr>
				</tfoot>
			</table>
			<p><span class="starrequired">*</span>Обязательные поля</p>
		</form>
	</noindex>
</div>
<link rel="stylesheet" type="text/css" href="design/{$settings->theme|escape}/css/register.css">
	