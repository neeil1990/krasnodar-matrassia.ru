{* Страница заказа *}

{$meta_title = "Ваш заказ №`$order->id`" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>Оплата</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->


<!-- Main Container -->
<section class="main-container col1-layout">
    <div class="main container">
        <div class="col-main">
            <div class="cart">

                <div class="page-content page-order">
	                
	                <div class="alert alert-info a-center" role="alert">
		                <h2>🎉<br />Спасибо за заказ!</h2>
		                <p>Менеджер свяжется с вами в ближайшее время для согласования деталей заказа</p>
		                <p>Мы работаем без выходных с 9 до 20</p>
	                </div>
	                
                    <div class="page-title">
                        <h2>
                            Ваш заказ №{$order->id}
                            {if $order->status == 0}принят{/if}
                            {if $order->status == 1}в обработке{elseif $order->status == 2}выполнен{/if}
                            {if $order->paid == 1}, оплачен{else}{/if}
                        </h2>
                    </div>

                    <div class="order-detail-content">
                        <div class="table-responsive">
                            <table class="table table-bordered cart_summary">
                                <thead>
                                <tr>
                                    <th class="cart_product"></th>
                                    <th>Название</th>
                                    <th>Наличие</th>
                                    <th>Цена</th>
                                    <th>Количество</th>
                                    <th>Всего</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$purchases item=purchase}
                                    <tr class="js-element js-element-id{$purchase->variant->id}" data-elementid="{$purchase->variant->id}">
                                        {$image = $purchase->product->images|first}
                                        <td class="cart_product"><a href="products/{$purchase->product->url}"><img src="{$image->filename|resize:90:90}" alt="{$purchase->product->name|escape}"></a></td>
                                        <td class="cart_description"><p class="product-name"><a href="products/{$purchase->product->url}">{$purchase->product->name|escape}</a></p>
                                            <small><a href="#">Размер : {$purchase->variant->name}</a></small></td>
                                        <td class="availability in-stock"><span class="label">Есть</span></td>
                                        <td class="price"><span>{($purchase->variant->price)|convert} {$currency->sign}</span></td>
                                        <td class="qty">{$purchase->amount}&nbsp;{$settings->units}</td>
                                        <td class="price"><span>{($purchase->variant->price*{$purchase->amount})|convert} {$currency->sign}</span></td>
                                    </tr>
                                {/foreach}
                                </tbody>
                                <tfoot>

                                {* Скидка, если есть *}
                                {if $order->discount > 0}
                                    <tr>
                                        <td class=""></td>
                                        <td class=""></td>
                                        <td colspan="3" class="name">скидка</td>
                                        <td colspan="2" class="price">
                                            {$order->discount}&nbsp;%
                                        </td>
                                    </tr>
                                {/if}
                                {* Купон, если есть *}
                                {if $order->coupon_discount > 0}
                                    <tr>
                                        <td class=""></td>
                                        <td class=""></td>
                                        <td colspan="3" class="name">купон</td>
                                        <td colspan="2" class="price">
                                            &minus;{$order->coupon_discount|convert}&nbsp;{$currency->sign}
                                        </td>
                                    </tr>
                                {/if}
                                {* Если стоимость доставки входит в сумму заказа *}
                                {if !$order->separate_delivery && $order->delivery_price>0}
                                    <tr>
                                        <td class=""></td>
                                        <td class=""></td>
                                        <td colspan="3" class="name">{$delivery->name|escape}</td>
                                        <td colspan="2" class="price">
                                            {$order->delivery_price|convert}&nbsp;{$currency->sign}
                                        </td>
                                    </tr>
                                {/if}
                                {* Если стоимость доставки не входит в сумму заказа *}
                                {if $order->separate_delivery}
                                    <tr>
                                        <td class=""></td>
                                        <td class=""></td>
                                        <td colspan="3" class="name">{$delivery->name|escape}</td>
                                        <td colspan="2" class="price">
                                            {$order->delivery_price|convert}&nbsp;{$currency->sign}
                                        </td>
                                    </tr>
                                {/if}
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td colspan="3"><strong>Итого</strong></td>
                                    <td colspan="2"><strong>{$order->total_price|convert}&nbsp;{$currency->sign}</strong></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            <div class="page-title">
                                <h2>Детали заказа</h2>
                            </div>
                            <div class="orders-list table-responsive">
                                <!--order info tables-->
                                <table class="table table-bordered cart_summary table-striped">
                                    <tr>
                                        <td>Дата заказа</td>
                                        <td>{$order->date|date} в {$order->date|time}</td>
                                    </tr>
                                    {if $order->name}
                                        <tr>
                                            <td>Имя</td>
                                            <td>{$order->name|escape}</td>
                                        </tr>
                                    {/if}
                                    {if $order->email}
                                        <tr>
                                            <td>Email</td>
                                            <td>{$order->email|escape}</td>
                                        </tr>
                                    {/if}
                                    {if $order->phone}
                                        <tr>
                                            <td>Телефон</td>
                                            <td>{$order->phone|escape}</td>
                                        </tr>
                                    {/if}
                                    {if $order->address}
                                        <tr>
                                            <td>Адрес доставки</td>
                                            <td>{$order->address|escape}</td>
                                        </tr>
                                    {/if}
                                    {if $order->comment}
                                        <tr>
                                            <td>Комментарий</td>
                                            <td>{$order->comment|escape|nl2br}</td>
                                        </tr>
                                    {/if}
                                </table>
                            </div>
                        </div>
                        {*
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            <div class="page-title">
                                <h2>Выберите способ оплаты</h2>
                            </div>
                            <div class="page-content checkout-page">
                                {if !$order->paid}
                                    {if $payment_methods && !$payment_method && $order->total_price>0}
                                        <h4 class="checkout-sep">Платежная информация</h4>
                                        <div class="box-border">
                                            <form method="post">
                                                <ul>
                                                    {foreach $payment_methods as $payment_method}
                                                    <li>
                                                        <label for="payment_{$payment_method->id}">
                                                            <input type="radio" checked name="payment_method_id" id=payment_{$payment_method->id} value='{$payment_method->id}' {if $payment_method@first}checked{/if}>
                                                            {$payment_method->name}, к оплате {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
                                                        </label>
                                                    </li>
                                                    {/foreach}
                                                </ul>
                                                <button type="submit" class="button" value="Закончить заказ"><i class="fa fa-angle-double-right"></i>&nbsp; <span>Закончить заказ</span></button>
                                            </form>
                                        </div>
                                    {elseif $payment_method}
                                        <h4 class="checkout-sep">Способ оплаты &mdash; {$payment_method->name}</h4>
                                        <div class="box-border">
                                            <h4>К оплате {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}</h4>
                                            <p>{$payment_method->description}</p>
                                            {/* Форма оплаты, генерируется модулем оплаты */}
                                            {checkout_form order_id=$order->id module=$payment_method->module}
                                            <form method=post>
                                                <button type="submit" name="reset_payment_method" class="button" value="Выбрать другой способ оплаты"><i class="fa fa-angle-double-right"></i>&nbsp; <span>Выбрать другой способ оплаты</span></button>
                                            </form>
                                        </div>
                                    {/if}
                                {/if}
                            </div>
                        </div>
                        *}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
