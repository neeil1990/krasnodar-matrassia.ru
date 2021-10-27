{* Шаблон корзины *}

{$meta_title = "Корзина" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>Корзина</span></li>
</ul>
				
<h1>
{if $cart->purchases}В корзине {$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}
{else}Корзина пуста{/if}
</h1>

{if $cart->purchases}
<form method="post" name="cart">
	<div id="personalCart">
		{* Список покупок *}
		<span class="heading">Товары готовые к заказу</span>
		<ul class="productList">
			{foreach $cart->purchases as $purchase}
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
									<a class="delete" href="cart/remove/{$purchase->variant->id}"></a>
								</td>
								
								<td>	
									<a class="title" target="_blank" href="products/{$purchase->product->url}"><span>{$purchase->product->name|escape}</span></a>
									<span class="price">
										{if $purchase->variant->compare_price > 0}<s>{$purchase->variant->compare_price|convert}<span class="rouble"> {$currency->sign}</span></s>{/if}
										<span class="priceNow">{($purchase->variant->price)|convert}&nbsp;<span class="rouble">{$currency->sign}</span></span>
									</span>
									<span class="noAvailable">{$purchase->variant->name|escape} &nbsp;</span>
									<div class="basketQty le-quantity">
										<a class="minus" href="#"></a>
											<input type="text" class="qty" name="amounts[{$purchase->variant->id}]" value="{$purchase->amount}"  onchange="document.cart.submit();">
										<a class="plus" href="#"></a>
									</div>
								</td>
							</tr>
					</tbody>
				</table>
			</li>
			{/foreach}
		</ul>

{if $user->discount}
<tr>
	<th class="image"></th>
	<th class="name">скидка</th>
	<th class="price"></th>
	<th class="amount"></th>
	<th class="price">
		{$user->discount}&nbsp;%
	</th>
	<th class="remove"></th>
</tr>
{/if}
{if $coupon_request}
<tr class="coupon">
	<th class="image"></th>
	<th class="name" colspan="3">Код купона или подарочного ваучера
		{if $coupon_error}
		<div class="message_error">
			{if $coupon_error == 'invalid'}Купон недействителен{/if}
		</div>
		{/if}
	
		<div>
		<input type="text" name="coupon_code" value="{$cart->coupon->code|escape}" class="coupon_code">
		</div>
		{if $cart->coupon->min_order_price>0}(купон {$cart->coupon->code|escape} действует для заказов от {$cart->coupon->min_order_price|convert} {$currency->sign}){/if}
		<div>
		<input type="button" name="apply_coupon" id="cupon_button" value="Применить купон" onclick="document.cart.submit();">
		</div>
	</th>
	<th class="price">
		{if $cart->coupon_discount>0}
		&minus;{$cart->coupon_discount|convert}&nbsp;{$currency->sign}
		{/if}
	</th>
	<th class="remove"></th>
</tr>

{literal}
<script>
$("input[name='coupon_code']").keypress(function(event){
	if(event.keyCode == 13){
		$("input[name='name']").attr('data-format', '');
		$("input[name='email']").attr('data-format', '');
		document.cart.submit();
	}
});
</script>
{/literal}

{/if}	

<div class="orderLine">
	<div id="sum">
		<span id="total">Товаров на сумму: <span id="allSum">{$cart->total_price|convert}&nbsp;<span class="rouble">{$currency->sign}</span></span></span> <br>
		Всего товаров: <span id="countItems">{$cart->total_products}</span>
	</div>
</div>
		

{* Доставка *}
{if $deliveries}
<div class="orderContainer" id="order">
<span class="heading gray">Выберите способ доставки:</span> 
<ul id="deliveries">
	{foreach $deliveries as $delivery}
	<li>
		<div class="checkbox">
			<input type="radio" name="delivery_id" value="{$delivery->id}" {if $delivery_id==$delivery->id}checked{elseif $delivery@first}checked{/if} id="deliveries_{$delivery->id}">
		</div>
		
			<h3>
			<label for="deliveries_{$delivery->id}">
			{$delivery->name}
			{if $cart->total_price < $delivery->free_from && $delivery->price>0}
				({$delivery->price|convert}&nbsp;{$currency->sign})
			{elseif $cart->total_price >= $delivery->free_from}
				(бесплатно)
			{/if}
			</label>
			</h3>
			<div class="description">
			{$delivery->description}
			</div>
	</li>
	{/foreach}
</ul>
</div>
{/if}	
		
		<div class="orderContainer" id="order">
			<span class="heading gray">Оформление заказа</span> 
			<p class="notice">Заполните, пожалуйста, Ваши данные для заказа</p>
				<div class="orderProps active">
					{if $error}
					<div class="message_error">
						{if $error == 'empty_name'}Введите имя{/if}
						{if $error == 'empty_email'}Введите email{/if}
						{if $error == 'captcha'}Капча введена неверно{/if}
					</div>
					{/if}
					<ul class="userProp">
						<li>
							<span class="label">Ф.И.О.*</span>
							<label>Например: Иванов Константин Сергеевич</label>
							<input name="name" type="text" value="{$name|escape}" data-format=".+" data-notice="Введите имя"/>
						</li>
						<li>
							<span class="label">Email*</span>
							<label>Например: info@test.ru</label>
							<input name="email" type="text" value="{$email|escape}" data-format="email" data-notice="Введите email" />
						</li>
						<li>
							<span class="label">Телефон</span>
							<label>Например: +3 (805) 123-45-67</label>
							<input name="phone" type="text" value="{$phone|escape}" />
						</li>
						<li>
							<span class="label">Адрес доставки*</span>
							<label></label>
							<input name="address" type="text" value="{$address|escape}"/>
						</li>
						<li>
							<span class="label">Комментарий к заказу</span>
							<textarea name="comment" rows="5" class="field" id="order_comment">{$comment|escape}</textarea>
						</li>
						<li>
							<span class="captcha" style="float: left; margin-right: 15px;"><img alt="captcha" src="captcha/image.php?4994"></span> 
							<input type="text" data-notice="Введите капчу" data-format="\d\d\d\d" value="" name="captcha_code" id="comment_captcha" class="input_captcha" style="width: 150px; height: 43px;">
						</li>
					</ul>
				</div>
			<div id="orderSum">
				<span id="orderTotal">Сумма заказа: <span id="allOrderSum">{$cart->total_price|convert}<span class="rouble"> {$currency->sign}</span></span></span> <br>
			</div>
			<div class="agree_block">
				<input type="checkbox" id="agree_checkbox" class="agree_checkbox">
				<label for="agree_checkbox">Я принимаю условия политики конфиденциальности</label>
				<br>
				<a class="agree_link" href="/politika-konfidentsialnosti">Политика конфиденциальности</a></span>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
				<script>
                    $(function(){
                        $('.btn_final_order').prop('disabled', true);
                        $('.btn_final_order').addClass('btn_final_order_disabled');
                        $('.agree_checkbox').on('change',function(){
                            if($(this).is( ":checked" )){
                                $('.btn_final_order').prop('disabled', false);
                                $('.btn_final_order').removeClass('btn_final_order_disabled');
                            }else{
                                $('.btn_final_order').prop('disabled', true);
                                $('.btn_final_order').addClass('btn_final_order_disabled');
                            }
                        });
                    })
				</script>
			</div>
			<input type="submit" id="orderMake" name="checkout"  class="order btn_final_order" value="Оформить заказ">
		</div>
	</div>
</form>
{else}
  В корзине нет товаров
{/if}			
