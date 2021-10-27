{* Шаблон страницы зарегистрированного пользователя *}

{* Страница регистрации *}

{* Канонический адрес страницы *}
{$canonical="/user" scope=parent}

{$meta_title = "Личный кабинет" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>{$user->name|escape}</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->

<!-- Main Container -->
<section class="main-container col2-right-layout">
    <div class="main container">
        <div class="row">
            <div class="col-main col-sm-9 col-xs-12">
                <div class="my-account">
                    {if $orders}
                    <div class="page-title">
                        <h2>Ваши заказы</h2>
                    </div>
                    <div class="orders-list table-responsive">
                        <!--order info tables-->
                        <table class="table table-bordered cart_summary table-striped">
                            <tr>
                                <th style="text-align: left">Дата</th>
                                <th style="text-align: left">Номер заказа</th>
                                <th style="text-align: left">Статус</th>
                                <th style="text-align: left">Итог</th>
                            </tr>
                            {foreach name=orders item=order from=$orders}
                            <tr>
                                <td class="order-number">{$order->date|date}</td>
                                <td data-title="Order Number">Заказ №{$order->id}</td>
                                <td data-title="Order Number">
                                    {if $order->paid == 1}оплачен,{/if}
                                    {if $order->status == 0}ждет обработки{elseif $order->status == 1}в обработке{elseif $order->status == 2}выполнен{/if}
                                </td>
                                <td data-title="Order Number">{$order->total_price|convert} {$currency->sign}</td>
                            </tr>
                            {/foreach}
                        </table>
                    </div>
                    {/if}
                    <div class="row">
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            <div class="page-title">
                                <h2>{$user->name|escape}</h2>
                            </div>
                            <br>
                            <form class="form" method="post">

                                <label for="emmail_login">Имя<span class="required">*</span></label>
                                <input class="form-control" data-format=".+" data-notice="Введите имя" value="{$name|escape}" name="name" maxlength="255" type="text"/><br>

                                <label for="password_login">Email<span class="required">*</span></label>
                                <input class="form-control" data-format="email" data-notice="Введите email" value="{$email|escape}" name="email" maxlength="255" type="text"/><br>

                                <label for="password_login">Изменить пароль<span class="required">*</span></label>
                                <input class="form-control" id="password" value="" name="password" type="password" /><br>
                                <button class="button" type="submit" value="Сохранить"><i class="icon-lock icons"></i>&nbsp; <span>Сохранить</span></button>
                            </form>
                        </div>
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            {if $error}
                                <div class="alert alert-danger" role="alert">
                                    <i class="fa fa-exclamation-circle fa-lg"></i>
                                    {if $error == 'empty_name'}Введите имя
                                    {elseif $error == 'empty_email'}Введите email
                                    {elseif $error == 'empty_password'}Введите пароль
                                    {elseif $error == 'user_exists'}Пользователь с таким email уже зарегистрирован
                                    {else}{$error}{/if}
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            <aside class="right sidebar col-sm-3 col-xs-12"></aside>
        </div>
    </div>
</section>

