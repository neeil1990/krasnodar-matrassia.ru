<div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle">
    <a href="/cart">
        <div class="cart-icon"><i class="icon-basket-loaded icons"></i><span class="cart-total">{$cart->total_products}</span></div>
        <div class="shoppingcart-inner hidden-xs"><span class="cart-title">Корзина</span> </div>
    </a>
</div>
<div>
    <div class="top-cart-content">
        <div class="block-subtitle">Товары в корзине</div>
        <ul id="cart-sidebar" class="mini-products-list">
            {foreach  item=p from=$cart->purchases}
                <li class="item odd">
                    <a href="products/{$p->product->url}" title="{$p->product->name}" class="product-image">
                        {foreach item=img from=$p->product->images}
                            <img src="{$img->filename|resize:65:65}" alt="{$p->product->name}" width="65">
                            {break}
                        {/foreach}
                    </a>
                    <div class="product-details">
                        <a href="cart/remove/{$p->variant->id}" title="Удалить" class="remove-cart"><i class="pe-7s-trash"></i></a>
                        <p class="product-name"><a href="products/{$p->product->url}">{$p->product->name}</a> </p>
                        <strong>{$p->amount}</strong> x <span class="price">{$p->variant->price|convert} {$currency->sign|escape}</span>
                    </div>
                </li>
            {/foreach}
        </ul>
        <div class="top-subtotal">Сумма: <span class="price">{$cart->total_price|convert}  {$currency->sign|escape}</span></div>
        <div class="actions">
            <button class="btn-checkout" type="button" onClick="location.href='/cart'"><i class="fa fa-check"></i><span>Оформить заказ</span></button>
        </div>
    </div>
</div>

