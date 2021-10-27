{* Шаблон корзины *}

{$meta_title = "Корзина" scope=parent}

<ul class="breadcrumb-navigation">
	<li><a title="Главная" href="/">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a title="Сравнение товаров" href="/cart" class="last">Корзина</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>

<h1>
{if $cart->purchases}В корзине {$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}
{else}Корзина пуста{/if}
</h1>

{if $cart->purchases}
<form method="post" name="cart">


<div id="content">
  <div class="cart-issue">	
    <div id="over_fon" style="display: none;">
    </div>	
    <div id="over_fon2" style="display: block;">
    </div>	
    <table class="table-resize" width="100%">		
      <tbody>			
        <tr>				
          <td class="left-resize">
            <div id="go_basket" class="go_basket nextorder multimage_bottom remove_for_tablet" style="display: none;">Изменить заказ
            </div>

              <div class="profile_block">
                <div class="profile_block_head back3">Корзина
                </div>
                <div class="profile_block_body clearfix">
                  <table class="data-table">
                    <tbody>
                    {foreach from=$cart->purchases item=purchase}
                      <tr class="js-element js-element-id{$purchase->variant->id}" data-elementid="{$purchase->variant->id}">
                        <td class="img-basket">
     {$image = $purchase->product->images|first}
		{if $image}
		<a href="products/{$purchase->product->url}"><img  class="image"  src="{$image->filename|resize:90:90}" alt="{$purchase->product->name|escape}"></a>
		{/if}
                         </td>
                        <td class="center_td">
                          <div class="prop_item basketname clearfix">
                           		<a href="products/{$purchase->product->url}">{$purchase->product->name|escape}</a>
		{$purchase->variant->name|escape}
                          </div>
                          <div class="prop_item quantity clearfix">
                            <div class="prop_name">Количество: 
                            </div>
                            <div class="prop_value prod_quantity clearfix">
                              <a class="multimage_icons minus  js-basket-minus1"></a>
                              <input maxlength="18" class="value" type="text" name="amounts[{$purchase->variant->id}]" value="{$purchase->amount}"  onchange="document.cart.submit();" data-ratio="1" >
                              <a class="multimage_icons plus js-basket-plus1"></a>
                            </div>
                          </div></td>
                        <td class="col_price">
                          <span class="price">{($purchase->variant->price)|convert} {$currency->sign}
                          </span>
                          <br><br style="line-height:20px;">
                          <a class="multimage_icons delete" href="cart/remove/{$purchase->variant->id}">Удалить</a>
                          <br></td>
                      </tr>
                      {/foreach}
                      <tr>
                        <td align="right" colspan="3"><b>Итого:</b>&nbsp;&nbsp;
                          <span class="all_price">{$cart->total_price|convert}&nbsp;{$currency->sign}
                          </span>
                          <br></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
             
              <div class="button-float clearfix">
               
                <a id="butt" class="btn1 prevorder" href="javascript:void(0);">
                  <i class="icon multimage_icons"></i>Оформить заказ</a>

              </div>
					


            		</td>				
          <td class="right-resize">
            <div id="order_form_div">
              <noscript>&lt;div class="errortext"&gt;Для оформления заказа необходимо включить JavaScript. По-видимому, JavaScript либо не поддерживается браузером, либо отключен. Измените настройки браузера и затем &lt;a href=""&gt;повторите попытку&lt;/a&gt;.&lt;/div&gt;
              </noscript>
              <div id="go_basket2" class="go_basket prevorder multimage_bottom remove_for_tablet" style="display: block;">Оформить заказ
              </div>
                <div id="order_form_content">
{* Доставка *}
{if $deliveries}                
                  <div class="profile_block property">
                    <div class="profile_block_head back3">Выберите способ доставки:
                    </div>
                    <div class="profile_block_body clearfix">
<ul id="deliveries" class="no">
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
                  </div>
 {/if}                 
                  
                   <div class="profile_block property">
                    <div class="profile_block_head back3">Адрес получателя:
                    </div>
                    <div class="profile_block_body clearfix">
<div class="form cart_form answer_form ">         
	{if $error}
	<div class="message_error">
		{if $error == 'empty_name'}Введите имя{/if}
		{if $error == 'empty_email'}Введите email{/if}
		{if $error == 'captcha'}Капча введена неверно{/if}
	</div>
	{/if}

	<input name="name" class="textinput40" type="text" value="{$name|escape}" placeholder="Имя, фамилия" data-format=".+" data-notice="Введите имя"/>
	

	<input name="email"  class="textinput40" type="text" value="{$email|escape}"  placeholder="Email"  data-format="email" data-notice="Введите email" />


	<input name="phone"  class="textinput40" type="text" value="{$phone|escape}" placeholder="Телефон" />
	

	<input name="address"  class="textinput40" type="text" value="{$address|escape}"  placeholder="Адрес доставки"/>

	<textarea name="comment" class="textareainput textareainput_comment multimage_backs"   placeholder="Комментарий к заказу" id="order_comment">{$comment|escape}</textarea>
	
	<div class="captcha"><img src="captcha/image.php?{math equation='rand(10,10000)'}" alt='captcha'/></div> 
	<input class="input_captcha textinput40" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>

    <div class="agree_block">
        <input type="checkbox" id="agree_checkbox" class="agree_checkbox">
        <label for="agree_checkbox">Я принимаю условия политики конфиденциальности</label>
        <a class="agree_link" href="/politika-konfidentsialnosti">Политика конфиденциальности</a></span>
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

	<input type="submit" name="checkout" class="btn1 btn_final_order" value="Оформить заказ">
	</div>
                    </div>
                  </div>                 

                </div>

            </div>
  			</td>			
        </tr>		
      </tbody>	
    </table>
  </div>
</div>

	

   
</form>
{else}
  В корзине нет товаров
{/if}