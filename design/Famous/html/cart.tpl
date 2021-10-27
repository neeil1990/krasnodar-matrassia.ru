{* Шаблон корзины *}

{$meta_title = "Корзина" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>Корзина</strong></li>
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
                    <div class="page-title">
                        <h2>{if $cart->purchases}В корзине {$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}{else}Корзина пуста{/if}</h2>
                    </div>

                    {if $cart->purchases}
                    <form method="post" name="cart">

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
                                    <th  class="action"><i class="fa fa-trash-o"></i></th>
                                </tr>
                                </thead>
                                <tbody>

                                {foreach from=$cart->purchases item=purchase}
                                <tr class="js-element js-element-id{$purchase->variant->id}" data-elementid="{$purchase->variant->id}">
                                    {$image = $purchase->product->images|first}
                                    <td class="cart_product"><a href="products/{$purchase->product->url}"><img src="{$image->filename|resize:90:90}" alt="{$purchase->product->name|escape}"></a></td>
                                    <td class="cart_description"><p class="product-name"><a href="products/{$purchase->product->url}">{$purchase->product->name|escape}</a></p>
                                        <small><a href="#">Размер : {$purchase->variant->name}</a></small></td>
                                    <td class="availability in-stock"><span class="label">Есть</span></td>
                                    <td class="price"><span>{($purchase->variant->price)|convert} {$currency->sign}</span></td>
                                    <td class="qty"><input class="form-control input-sm" name="amounts[{$purchase->variant->id}]" type="text" value="{$purchase->amount}" onchange="document.cart.submit();"></td>
                                    <td class="price"><span>{($purchase->variant->price*{$purchase->amount})|convert} {$currency->sign}</span></td>
                                    <td class="action"><a href="cart/remove/{$purchase->variant->id}"><i class="icon-close"></i></a></td>
                                </tr>
                                {/foreach}

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="2" rowspan="2"></td>
                                    <td colspan="3"><strong>Итого</strong></td>
                                    <td colspan="2"><strong>{$cart->total_price|convert}&nbsp;{$currency->sign} </strong></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <div class="page-title">
                        <h2>Оформление заказа</h2>
                    </div>
                    <div class="row">
                        {if $deliveries}
                        <div class="col-sm-6" id="contact_form_map">
                            <h3 class="page-subheading">Выберите способ доставки</h3>
                            <br>
                            <ul id="deliveries" class="no">
                                {foreach $deliveries as $delivery}
                                    <li>
                                        <input type="radio" name="delivery_id" value="{$delivery->id}" {if $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries_{$delivery->id}">
                                        <label for="deliveries_{$delivery->id}" class="deliveries-title color-black">
                                            {$delivery->name}
                                            {if $cart->total_price < $delivery->free_from && $delivery->price>0}
                                                ({$delivery->price|convert}&nbsp;{$currency->sign})
                                            {elseif $cart->total_price >= $delivery->free_from}
                                                {if $delivery->id != 1}(бесплатно){/if}
                                            {/if}
                                        </label>
                                        <p class="description">
                                            {$delivery->description}
                                        </p>
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                        {/if}
                        <div class="col-sm-6">
                            <h3 class="page-subheading">Адрес получателя</h3>
                            <br>
                            {if $error}
                                <div class="alert alert-danger" role="alert">
                                    <i class="fa fa-exclamation-circle fa-lg"></i>
                                    {if $error == 'empty_name'}Введите имя{/if}
                                    {if $error == 'empty_email'}Введите email{/if}
                                    {if $error == 'captcha'}Капча введена неверно{/if}
                                </div>
                            {/if}
                            <div class="content">
                                <label for="emmail_login">Имя, фамилия<span class="required">*</span></label>
                                <input name="name" class="form-control" type="text" value="{$name|escape}" placeholder="Имя, фамилия" data-format=".+" data-notice="Введите имя"/>
                                <br>
                                <label for="emmail_login">Email<span class="required">*</span></label>
                                <input name="email"  class="form-control" type="text" value="{$email|escape}"  placeholder="Email"  data-format="email" data-notice="Введите email" />
                                <br>
                                <label for="emmail_login">Телефон<span class="required">*</span></label>
                                <input name="phone"  class="form-control" type="text" value="{$phone|escape}" placeholder="Телефон" />
                                <br>
                                <label for="emmail_login">Адрес доставки<span class="required">*</span></label>
                                <input name="address"  class="form-control" type="text" value="{$address|escape}"  placeholder="Адрес доставки"/>
                                <br>
                                <textarea name="comment" class="form-control"   placeholder="Комментарий к заказу" id="order_comment">{$comment|escape}</textarea>
                                <br>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="well well-sm" style="padding: 0;text-align: center;background: #FFFFFF;"><img style="height: 34px" src="captcha/image.php?{math equation='rand(10,10000)'}" alt='captcha'/></div>
                                    </div>
                                    <div class="col-lg-9">
                                        <input class="input_captcha form-control" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
                                    </div>
                                </div>
                                <br>
                                <div class="agree_block">
                                    <input type="checkbox" id="agree_checkbox" class="agree_checkbox">
                                    <label for="agree_checkbox">Я принимаю условия политики конфиденциальности</label>
                                    <a class="agree_link" href="/politika-konfidentsialnosti">Политика конфиденциальности</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="order-detail-content">
                        <div class="cart_navigation">
                            <a class="continue-btn" href="/"><i class="fa fa-arrow-left"> </i>&nbsp; Продолжить покупки</a>
                            <button type="submit" class="checkout-btn" name="checkout" value="Оформить заказ"><i class="fa fa-check"></i> Оформить заказ</button>
                        </div>
                    </div>
                    </form>
                    {else}
                        <h2>В корзине нет товаров</h2>
                    {/if}


                </div>
            </div>
        </div>
    </div>
</section>
