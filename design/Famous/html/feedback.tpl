{* Страница с формой обратной связи *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>{$page->name|escape}</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->

<!-- Main Container -->
<section class="main-container col1-layout">
    <div class="main container">
        <div class="row">
            <section class="col-main col-sm-12">
                <div id="contact" class="page-content page-contact">
                    <div class="page-title">
                        <h2>{$page->name|escape}</h2>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6" id="contact_form_map">
                            {$page->body}
                        </div>
                        <div class="col-sm-6">
                            <h3 class="page-subheading">Обратная связь</h3>
                            {if $message_sent}
                            <div class="alert alert-success" role="alert">
                                <i class="fa fa-exclamation-circle fa-lg"></i>
                                {$name|escape}, ваше сообщение отправлено.
                            </div>

                                <script type="text/javascript">
                                    window.onload = function() {
                                        ym({$settings->metrika|escape}, 'reachGoal', 'Obranaya-svyaz',function(){
                                            console.log("Obranaya-svyaz send!")
                                        });
                                    }
                                </script>
                            {else}
                                {if $error}
                                    <div class="alert alert-danger" role="alert">
                                        <i class="fa fa-exclamation-circle fa-lg"></i>
                                        {if $error == 'captcha'}Неверно введена капча{/if}
                                        {if $error == 'empty_name'}Введите имя{/if}
                                        {if $error == 'empty_email'}Введите email{/if}
                                        {if $error == 'empty_text'}Введите сообщение{/if}
                                    </div>
                                {/if}
                            {/if}
                            <form class="form feedback_form" method="post">
                                <div class="contact-form-box">
                                    <div class="form-selector">
                                        <label>Имя</label>
                                        <input class="form-control input-sm" data-format=".+" data-notice="Введите имя" value="{$name|escape}" name="name" maxlength="255" type="text"/>
                                    </div>
                                    <div class="form-selector">
                                        <label>Email</label>
                                        <input class="form-control input-sm" data-format="email" data-notice="Введите email" value="{$email|escape}" name="email" maxlength="255" type="text"/>
                                    </div>
                                    <div class="form-selector">
                                        <label>Сообщение</label>
                                        <textarea  class="form-control input-sm"  data-format=".+" data-notice="Введите сообщение" value="{$message|escape}" name="message">{$message|escape}</textarea>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="well well-sm" style="padding: 0;text-align: center;background: #FFFFFF;">
                                                <img style="height: 34px;" src="captcha/image.php?{math equation='rand(10,10000)'}"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <input class="input_captcha form-control" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
                                        </div>
                                    </div>
                                    <div class="agree_block">
                                        <input type="checkbox" id="agree_checkbox" class="agree_checkbox" checked="checked" required>
                                        <label for="agree_checkbox">Я принимаю условия политики конфиденциальности</label>
                                        <a class="agree_link" href="/politika-konfidentsialnosti">Политика конфиденциальности</a>
                                    </div>
                                    <div class="form-selector">
                                        <button type="submit" value="Отправить" name="feedback" class="button"><i class="icon-paper-plane icons"></i>&nbsp; <span>Отправить</span></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</section>
<!-- Main Container End -->
