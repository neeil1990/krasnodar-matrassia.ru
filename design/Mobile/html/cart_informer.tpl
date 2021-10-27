{* Информера корзины (отдаётся аяксом) *}
{if $cart->total_products>0}
<ul id="footerCart">
<li id="footBasket"><a href="./cart/">Корзина <span id="footCart" class="">{$cart->total_products}</span></a></li>
<li id="footSumm"><a href="./cart/">{$cart->total_price|convert} <span class="rouble">{$currency->sign|escape}</span></a></li>
<li id="footBuy"><a href="./cart/">Оформить</a></li>
</ul>
{/if}



