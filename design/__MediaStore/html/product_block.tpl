<div class="catalog-item prod js-element-id{$product->id} js-element {if $page && $page->url==''}{if $product->variant->compare_price > 0}qb{/if}{else}{if $product->featured}da{/if} {if $product->variant->compare_price > 0}qb{/if} {/if}" data-key1="{$product->id}" data-elementid="{$product->id}">
	<div class="catalog-item_inner">
		<a class="qb_corner" href="products/{$product->url}"></a>
		<a class="da_corner" href="products/{$product->url}"></a>
		<div class="catalog-item_inside">
			<div class="catalog-item-picture">
				<a  href="products/{$product->url}" title="{$product->name|escape}">
					<img class="image" src="{$product->image->filename|resize:160:160}" rel="image_src" alt="{$product->name|escape}">
				</a>
			</div>
		  <div class="catalog-item-name">
			<a class="text_fader" data-product="{$product->id}" href="products/{$product->url}" title="{$product->name|escape}">{$product->name|escape}</a>
		  </div>
		</div>
		<div class="catalog-item-price clearfix">
			{if $product->variants|count > 0}
			{if $product->variant->compare_price > 0}
				<div class="discount">-<span class="disc">{($product->variant->compare_price-$product->variant->price)|convert}</span>{$currency->sign|escape}</div>
				<div class="crossed_price"><span class="cros">{$product->variant->compare_price|convert}</span> {$currency->sign|escape}</div>
			{/if}
				<div class="price"><span class="pr">{$product->variant->price|convert}</span> {$currency->sign|escape}</div>
			{else}
				<div class="price">Нет в наличии</div>
			{/if}
		</div>
		<div class="catalog-item_2nd_inside clearfix">
			 <div class="catalog-item-buy_btn">
				{if $product->variants|count > 0}
				<noindex>
					<form class="clearfix variants" name="buy_form" action="cart">
						<input  class="grandibtn1 submit add2basket js_add2basket_link" type="submit" value="В корзину" data-result-text="Товар добавлен в корзину">
						<div class="catalog-item-compare">
							{* Не показывать выбор варианта, если он один и без названия *}
							<select name="variant" {if $product->variants|count==1  && !$product->variant->name}style='display:none;'{/if}>
								{foreach $product->variants as $v}
								<option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"  discount="{($v->compare_price-$v->price)|convert}"{/if} price="{$v->price|convert}">
								{$v->name}
								</option>
								{/foreach}
							</select>
						</div>
						<span class="measure_name">шт</span>
						<div class="prod_quantity clearfix">
							<a class="multimage_icons minus js-basket-minus"></a>
							<input type="text" class="multimage_backs value" name="amount" value="1" data-ratio="1">
							<a class="multimage_icons plus js-basket-plus"></a>
						</div>
					</form>
				</noindex>
				{/if}
			</div>
			<div class="catalog-item-preview_text">
			{$product->annotation}
			</div>
			<div class="catalog-item-compare" rel="nofollow">
				<form action="/compare" class="compare">
					{if $compare_informer->items_id[{$product->id}]>0}
						В <a href="/compare/">сравнения</a>
					{else}
						<input id="compare_{$product->id}" name="compare" value="{$product->id}" class="add2compare js_add2compare" style="display:none;" type="checkbox" />
						<label for="compare_{$product->id}" style="cursor: pointer">Сравнить</label>
					{/if}
				</form>
			</div>
			<div class="catalog-item-likes_and_share clearfix"> 
				<div class="yashare-auto-init" data-yasharequickservices="vkontakte,facebook,twitter" data-yasharetype="none" data-yasharel10n="ru" data-yasharetitle="{$product->name|escape}" data-yasharelink="products/{$product->url}"></div> 
			</div>
		</div>
    </div>
</div>