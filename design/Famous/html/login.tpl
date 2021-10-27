{* Страница регистрации *}

{* Канонический адрес страницы *}
{$canonical="/user/login" scope=parent}

{$meta_title = "Вход" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>Вход</strong></li>
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
                    <h4>Вход</h4>
                    <p class="before-login-text">Добро пожаловать!</p>
                    <form class="form login_form" method="post">

                        <label for="emmail_login">Email<span class="required">*</span></label>
                        <input class="form-control"  type="text" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}" maxlength="255" />

                        <label for="password_login">Пароль<span class="required">*</span></label>
                        <input class="form-control"  type="password" name="password" data-format=".+" data-notice="Введите пароль" value="" />

                        <p class="forgot-pass"><a href="user/password_remind">Забыли пароль?</a></p>

                        <button class="button" type="submit" name="login" value="Войти"><i class="icon-lock icons"></i>&nbsp; <span>Войти</span></button>
                    </form>
                </div>
                <div class="box-authentication">
                    {if $error}
                        <div class="alert alert-danger" role="alert">
                            <i class="fa fa-exclamation-circle fa-lg"></i>
                            {if $error == 'login_incorrect'}Неверный логин или пароль
                            {elseif $error == 'user_disabled'}Ваш аккаунт еще не активирован.
                            {else}{$error}{/if}
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Main Container End -->