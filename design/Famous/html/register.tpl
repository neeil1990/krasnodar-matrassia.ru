{* Страница регистрации *}

{* Канонический адрес страницы *}
{$canonical="/user/register" scope=parent}

{$meta_title = "Регистрация" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>Регистрация</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->

<!-- Main Container -->
<section class="main-container col1-layout">
    <div class="main container">
        <div class="page-content">
            <div class="account-login">
                <div class="box-authentication">
                    <h4>Регистрация</h4>
                    <p class="before-login-text">Добро пожаловать!</p>
                    <form class="form register_form" method="post">

                        <label for="emmail_login">Имя<span class="required">*</span></label>
                        <input type="text" class="form-control" name="name" data-format=".+" data-notice="Введите имя" value="{$name|escape}" maxlength="255" />

                        <label for="password_login">Email<span class="required">*</span></label>
                        <input type="text" class="form-control" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}" maxlength="255" />

                        <label for="password_login">Пароль<span class="required">*</span></label>
                        <input type="password" class="form-control" name="password" data-format=".+" data-notice="Введите пароль" value="" />

                        <label for="password_login">Проверочный код<span class="required">*</span></label>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="well well-sm" style="padding: 0;text-align: center;background: #FFFFFF;">
                                    <img style="height: 34px;" src="captcha/image.php?{math equation='rand(10,10000)'}"/>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <input class="input_captcha form-control" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
                            </div>
                        </div>
                        <button class="button" type="submit" name="register" value="Зарегистрироваться"><i class="icon-lock icons"></i>&nbsp; <span>Зарегистрироваться</span></button>
                    </form>
                </div>
                <div class="box-authentication">
                    {if $error}
                        <div class="alert alert-danger" role="alert">
                            <i class="fa fa-exclamation-circle fa-lg"></i>
                            {if $error == 'empty_name'}Введите имя
                            {elseif $error == 'empty_email'}Введите email
                            {elseif $error == 'empty_password'}Введите пароль
                            {elseif $error == 'user_exists'}Пользователь с таким email уже зарегистрирован
                            {elseif $error == 'captcha'}Неверно введена капча
                            {else}{$error}{/if}
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Main Container End -->