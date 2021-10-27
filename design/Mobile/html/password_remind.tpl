{* Письмо пользователю для восстановления пароля *}

{* Канонический адрес страницы *}
{$canonical="/user/password_remind" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>Авторизация</span></li>
</ul>						

<div id="forgot">
	{if $email_sent}
<h1>Вам отправлено письмо</h1>

<p>На {$email|escape} отправлено письмо для восстановления пароля.</p>
{else}
	<h1>Забыли пароль?</h1>
		{if $error}
<div class="message_error">
	{if $error == 'user_not_found'}Пользователь не найден
	{else}{$error}{/if}
</div>
{/if}
	<form class="form" method="post">
		<p class="inf">Если вы забыли пароль, введите адрес электронной почты, указанный при регистрации. <br>Контрольная строка для смены пароля, а также ваши регистрационные данные, будут высланы вам на указанный email.</p>
		<table class="data-table bx-forgotpass-table">
			<thead>
				<tr> 
					<td colspan="2"><b>Выслать контрольную строку</b></td>
				</tr>
			</thead>
			<tbody>
				<tr> 
					<td>
						<label>E-Mail:</label>
						<input type="text" class="field" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}"  maxlength="255"/>
						<input type="submit" class="submit btn" value="Выслать" name="send_account_info">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	{/if}
</div>
<link rel="stylesheet" type="text/css" href="design/{$settings->theme|escape}/css/password_remind.css">
		