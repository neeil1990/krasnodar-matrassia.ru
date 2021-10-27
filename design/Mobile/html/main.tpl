{* Главная страница магазина *}

{* Для того чтобы обернуть центральный блок в шаблон, отличный от index.tpl *}
{* Укажите нужный шаблон строкой ниже. Это работает и для других модулей *}
{$wrapper = 'index.tpl' scope=parent}

{* Канонический адрес страницы *}
{$canonical="" scope=parent}

{* Рекомендуемые товары *}
{get_featured_products var=featured_products limit=8}
{if $featured_products}
<div class="mainOffers">
	<span class="heading">Хиты продаж</span>
		<ul class="productList">
			{foreach $featured_products as $product}
				<li class="product">
					<a data-product="{$product->id}" href="products/{$product->url}" class="name"><span>{$product->name|escape}</span></a>
					<table class="prTable">
						<tr>
							<td>
								<a href="products/{$product->url}" class="pic image">
									{if $product->image}
										<img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}">
									{else}
										<img src="design/{$settings->theme|escape}/images/noimg.png" alt="{$product->name|escape}">
									{/if}
								</a>
							</td>
							<td>
								<a data-product="{$product->id}" href="products/{$product->url}" class="title"><span>{$product->name|escape}</span></a>
								<span class="price">
									<span class="pr">{$product->variant->price|convert}</span><span class="rouble"> {$currency->sign|escape}</span>
									{if $product->variant->compare_price > 0}<s>{$product->variant->compare_price|convert} <span class="rouble">{$currency->sign|escape}</span></s>{/if}
								</span>
								{if $product->variants|count > 0}
									<form class="variants" action="/cart">
										<span class="available">В наличии</span>
										<select name="variant" style='display:none;'>
											{foreach $product->variants as $v}
												<option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"{/if} price="{$v->price|convert}">{$v->name}</option>
											{/foreach}
										</select>
											<input type="submit" class="addSku" value="В корзину" data-result-text="Добавлено"/>
										</form>
									{else}
									<span class="noAvailable">Нет в наличии</span>
									<a class="addCart disabled" href="#">В корзину</a>
								{/if}
							</td>
						</tr>
					</table>
				</li>
			{/foreach}
		</ul>
	<a href="#" class="showMore">Показать ещё</a>
 </div>
{/if}
{* Новинки *}
{get_new_products var=new_products limit=9}
{if $new_products}
<div class="mainOffers">
	<span class="heading">Новинки</span>
		<ul class="productList">
			{foreach $new_products as $product}
				<li class="product">
					<a data-product="{$product->id}" href="products/{$product->url}" class="name"><span>{$product->name|escape}</span></a>
					<table class="prTable">
						<tr>
							<td>
								<a href="products/{$product->url}" class="pic image">
									{if $product->image}
										<img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}">
									{else}
										<img src="design/{$settings->theme|escape}/images/noimg.png" alt="{$product->name|escape}">
									{/if}
								</a>
							</td>
							<td>
								<a data-product="{$product->id}" href="products/{$product->url}" class="title"><span>{$product->name|escape}</span></a>
								<span class="price">
									<span class="pr">{$product->variant->price|convert}</span><span class="rouble"> {$currency->sign|escape}</span>
									{if $product->variant->compare_price > 0}<s>{$product->variant->compare_price|convert} <span class="rouble">{$currency->sign|escape}</span></s>{/if}
								</span>
								{if $product->variants|count > 0}
									<form class="variants" action="/cart">
										<span class="available">В наличии</span>
										<select name="variant" style='display:none;'>
											{foreach $product->variants as $v}
												<option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"{/if} price="{$v->price|convert}">{$v->name}</option>
											{/foreach}
										</select>
											<input type="submit" class="addSku" value="В корзину" data-result-text="Добавлено"/>
										</form>
									{else}
									<span class="noAvailable">Нет в наличии</span>
									<a class="addCart disabled" href="#">В корзину</a>
								{/if}
							</td>
						</tr>
					</table>
				</li>
			{/foreach}
		</ul>
	<a href="#" class="showMore">Показать ещё</a>
 </div>
{/if}
{* Акционные товары *}
{get_discounted_products var=discounted_products limit=9}
{if $discounted_products}
<div class="mainOffers">
	<span class="heading">Акционные товары</span>
		<ul class="productList">
			{foreach $discounted_products as $product}
				<li class="product">
					<a data-product="{$product->id}" href="products/{$product->url}" class="name"><span>{$product->name|escape}</span></a>
					<table class="prTable">
						<tr>
							<td>
								<a href="products/{$product->url}" class="pic image">
									{if $product->image}
										<img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}">
									{else}
										<img src="design/{$settings->theme|escape}/images/noimg.png" alt="{$product->name|escape}">
									{/if}
								</a>
							</td>
							<td>
								<a data-product="{$product->id}" href="products/{$product->url}" class="title"><span>{$product->name|escape}</span></a>
								<span class="price">
									<span class="pr">{$product->variant->price|convert}</span><span class="rouble"> {$currency->sign|escape}</span>
									{if $product->variant->compare_price > 0}<s>{$product->variant->compare_price|convert} <span class="rouble">{$currency->sign|escape}</span></s>{/if}
								</span>
								{if $product->variants|count > 0}
									<form class="variants" action="/cart">
										<span class="available">В наличии</span>
										<select name="variant" style='display:none;'>
											{foreach $product->variants as $v}
												<option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"{/if} price="{$v->price|convert}">{$v->name}</option>
											{/foreach}
										</select>
											<input type="submit" class="addSku" value="В корзину" data-result-text="Добавлено"/>
										</form>
									{else}
									<span class="noAvailable">Нет в наличии</span>
									<a class="addCart disabled" href="#">В корзину</a>
								{/if}
							</td>
						</tr>
					</table>
				</li>
			{/foreach}
		</ul>
	<a href="#" class="showMore">Показать ещё</a>
 </div>
{/if}

{* Заголовок страницы *}
<h1>{$page->header}</h1>

{* Тело страницы *}
{$page->body}
