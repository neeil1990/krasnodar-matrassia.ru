{* Письмо пользователю для восстановления пароля *}

{* Канонический адрес страницы *}
{$canonical="/user/password_remind" scope=parent}

{$meta_title = "Напоминание пароля" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>Напоминание пароля</strong></li>
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
                <div class="col-md-4 hidden-xs"></div>
                <div class="col-lg-6 col-sm-8 col-md-7 col-xs-12">

                    {if $email_sent}
                        <div class="alert alert-success" role="alert">
                            <i class="fa fa-exclamation-circle fa-lg"></i>
                            Вам отправлено письмо на {$email|escape} для восстановления пароля.
                        </div>
                    {else}
                        {if $error}
                            <div class="alert alert-danger" role="alert">
                                <i class="fa fa-exclamation-circle fa-lg"></i>
                                {if $error == 'user_not_found'}Пользователь не найден
                                {else}{$error}{/if}
                            </div>
                        {/if}
                    {/if}

                    <div class="page-title">
                        <h2>Напоминание пароля</h2>
                    </div>
                    <fieldset class="col2-set">
                        <div class="col registered-users">
                            <div class="content">
                                <p>Введите email, который вы указывали при регистрации.</p>
                                <form class="form" method="post">
                                    <label for="emmail_login">Ваш Email<span class="required">*</span></label>
                                    <input type="text"  class="form-control" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}"  maxlength="255"/>
                                    <br>
                                    <div class="buttons-set">
                                        <button id="send2" type="submit" value="Вспомнить" class="button login"><span>Вспомнить</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Main Container End -->