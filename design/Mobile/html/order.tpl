{* Страница заказа *}

{$meta_title = "Ваш заказ №`$order->id`" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>Оформление заказа</span></li>
</ul>
				
<h1>Ваш заказ №{$order->id} 
{if $order->status == 0}принят{/if}
{if $order->status == 1}в обработке{elseif $order->status == 2}выполнен{/if}
{if $order->paid == 1}, оплачен{else}{/if}
</h1>


<div id="personalCart">
	{* Список покупок *}
	<span class="heading">Товары готовые к заказу</span>
	<ul class="productList">
		{foreach $purchases as $purchase}
		<li class="product">
			<a class="name" target="_blank" href="products/{$purchase->product->url}"><span>{$purchase->product->name|escape}</span></a>
				<table class="prTable">
					<tbody>
						<tr class="basketItemsRow">
							{* Изображение товара *}
							<td>
								{$image = $purchase->product->images|first}
								{if $image}
									<a class="pic" target="_blank" href="products/{$purchase->product->url}"><img alt="{$product->name|escape}" src="{$image->filename|resize:300:300}"></a>
								{else}
									<a class="pic" target="_blank" href="products/{$purchase->product->url}"><img alt="{$product->name|escape}" src="design/{$settings->theme|escape}/images/noimg_cart.png"></a>
								{/if}
							</td>
							<td>{* Название товара *}	
								<a class="title" target="_blank" href="products/{$purchase->product->url}"><span>{$purchase->product->name|escape}</span></a>
								<span class="price">
									{if $purchase->variant->compare_price > 0}<s>{$purchase->variant->compare_price|convert}<span class="rouble"> {$currency->sign}</span></s>{/if}
									<span class="priceNow">{($purchase->price*$purchase->amount)|convert}&nbsp;<span class="rouble">{$currency->sign}</span></span>
								</span>
								<span class="noAvailable">{$purchase->variant->name|escape} &nbsp;</span>
								{if $order->paid && $purchase->variant->attachment}
									<a class="download_attachment" href="order/{$order->url}/{$purchase->variant->attachment}">скачать файл</a>
								{/if}
							</td>
						<td>
							<span class="sum">{($purchase->price)|convert}&nbsp;<span class="rouble">{$currency->sign}</span> &times; {$purchase->amount}&nbsp;{$settings->units}</span>
						</td>
					</tr>
				</tbody>
			</table>
		</li>
		{/foreach}
	</ul>

	<div class="orderLine">
		<div id="sum">
			<span id="total">Товаров на сумму: <span id="allSum">{$order->total_price|convert}&nbsp;<span class="rouble">{$currency->sign}</span></span></span> <br>
			Всего товаров: <span id="countItems">{$cart->total_products}</span>
		</div>
	</div>

	{* Скидка, если есть *}
{if $order->discount > 0}
<tr>
	<th class="image"></th>
	<th class="name">скидка</th>
	<th class="price"></th>
	<th class="amount"></th>
	<th class="price">
		{$order->discount}&nbsp;%
	</th>
</tr>
{/if}
{* Купон, если есть *}
{if $order->coupon_discount > 0}
<tr>
	<th class="image"></th>
	<th class="name">купон</th>
	<th class="price"></th>
	<th class="amount"></th>
	<th class="price">
		&minus;{$order->coupon_discount|convert}&nbsp;{$currency->sign}
	</th>
</tr>
{/if}
{* Если стоимость доставки входит в сумму заказа *}
{if !$order->separate_delivery && $order->delivery_price>0}
<tr>
	<td class="image"></td>
	<td class="name">{$delivery->name|escape}</td>
	<td class="price"></td>
	<td class="amount"></td>
	<td class="price">
		{$order->delivery_price|convert}&nbsp;{$currency->sign}
	</td>
</tr>
{/if}
{* Итого *}
{* Если стоимость доставки не входит в сумму заказа *}
{if $order->separate_delivery}
<tr>
	<td class="image"></td>
	<td class="name">{$delivery->name|escape}</td>
	<td class="price"></td>
	<td class="amount"></td>
	<td class="price">
		{$order->delivery_price|convert}&nbsp;{$currency->sign}
	</td>
</tr>
{/if}

</table>

{* Детали заказа *}
<h2>Детали заказа</h2>
<table class="order_info">
	<tr>
		<td>
			Дата заказа
		</td>
		<td>
			{$order->date|date} в
			{$order->date|time}
		</td>
	</tr>
	{if $order->name}
	<tr>
		<td>
			Имя
		</td>
		<td>
			{$order->name|escape}
		</td>
	</tr>
	{/if}
	{if $order->email}
	<tr>
		<td>
			Email
		</td>
		<td>
			{$order->email|escape}
		</td>
	</tr>
	{/if}
	{if $order->phone}
	<tr>
		<td>
			Телефон
		</td>
		<td>
			{$order->phone|escape}
		</td>
	</tr>
	{/if}
	{if $order->address}
	<tr>
		<td>
			Адрес доставки
		</td>
		<td>
			{$order->address|escape}
		</td>
	</tr>
	{/if}
	{if $order->comment}
	<tr>
		<td>
			Комментарий
		</td>
		<td>
			{$order->comment|escape|nl2br}
		</td>
	</tr>
	{/if}
</table>


{if !$order->paid}
{* Выбор способа оплаты *}
{if $payment_methods && !$payment_method && $order->total_price>0}
<form method="post">
<h2>Выберите способ оплаты</h2>
<ul id="deliveries">
    {foreach $payment_methods as $payment_method}
    	<li>
    		<div class="checkbox">
    			<input type=radio name=payment_method_id value='{$payment_method->id}' {if $payment_method@first}checked{/if} id=payment_{$payment_method->id}>
    		</div>			
			<h3><label for=payment_{$payment_method->id}>	{$payment_method->name}, к оплате {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}</label></h3>
			<div class="description">
			{$payment_method->description}
			</div>
    	</li>
    {/foreach}
</ul>
<input type='submit' id="orderMake" class="order" value='Закончить заказ'>
</form>

{* Выбраный способ оплаты *}
{elseif $payment_method}
<h2>Способ оплаты &mdash; {$payment_method->name}
<form method=post><input type=submit name='reset_payment_method' id="orderOrde" class="order" value='Выбрать другой способ оплаты'></form>	
</h2>
<p>
{$payment_method->description}
</p>
<h2>
К оплате {$order->total_price|convert:$payment_method->currency_id}&nbsp;{$all_currencies[$payment_method->currency_id]->sign}
</h2>

{* Форма оплаты, генерируется модулем оплаты *}
{checkout_form order_id=$order->id module=$payment_method->module}
{/if}

{/if}

</div>
	