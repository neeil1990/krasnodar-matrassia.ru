{* Страница регистрации *}

{* Канонический адрес страницы *}
{$canonical="/user/register" scope=parent}

{$meta_title = "Регистрация" scope=parent}

<ul class="breadcrumb-navigation">
	<li><a title="Главная" href="/">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a title="Сравнение товаров" href="/user/register" class="last">Регистрация</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>  

<h1>Регистрация1</h1>

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

<form class="form register_form" method="post">
	<label>Имя</label>
	<input type="text" class="textinput40 back1" name="name" data-format=".+" data-notice="Введите имя" value="{$name|escape}" maxlength="255" />
	
	<label>Email</label>
	<input type="text" class="textinput40 back1" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}" maxlength="255" />

    <label>Пароль</label>
    <input type="password" class="textinput40 back1" name="password" data-format=".+" data-notice="Введите пароль" value="" />

	<div class="captcha"><img src="captcha/image.php?{math equation='rand(10,10000)'}"/></div> 
	<input class="input_captcha textinput40 back1" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>

	<input type="submit" class="multimage_bottom smartlink_set btn1 apply" name="register" value="Зарегистрироваться">

</form>
