{* Список товаров *}

{* Канонический адрес страницы *}
{if $category && $brand}
{$canonical="/catalog/{$category->url}/{$brand->url}" scope=parent}
{elseif $category}
{$canonical="/catalog/{$category->url}" scope=parent}
{elseif $brand}
{$canonical="/brands/{$brand->url}" scope=parent}
{elseif $keyword}
{$canonical="/products?keyword={$keyword|escape}" scope=parent}
{else}
{$canonical="/products" scope=parent}
{/if}

<ul id="breadcrumbs">
	<li><a href="/"><span>Главная</span></a> /</li>
	{if $category}
	{foreach $category->path as $cat}
	<li><a title="{$cat->name|escape}" href="catalog/{$cat->url}"><span>{$cat->name|escape}</span></a> /</li>
	{/foreach}  
	{if $brand}
	<li><a title="{$brand->name|escape}" href="catalog/{$cat->url}/{$brand->url}"><span>{$brand->name|escape}</span></a> /</li>
	{/if}
	{elseif $brand}
	<li><a title="{$brand->name|escape}" href="brands/{$brand->url}"><span>{$brand->name|escape}</span></a> /</li>
	{elseif $keyword}
	<li><span>Поиск</span></li>
	{/if}
</ul>

{* Заголовок страницы *}
{if $keyword}
<h1>Поиск {$keyword|escape}</h1>
{elseif $page}
<h1>{$page->name|escape}</h1>
{else}
<h1>{$category->name|escape} {$brand->name|escape}</h1>
{/if}

{if $category->subcategories}
	<div class="collapsedBlock" id="clarify">
		<a class="heading trigger" href="#"><img alt="" src="design/{$settings->theme|escape}/images/1443780414_menu.png"> Уточнить раздел</a>
		<div class="collapsedContent">
			<ul>
				{foreach $category->subcategories as $c}
					{if $c->visible}
						<li><a {if $category->id == $c->id}class="selected"{/if} href="catalog/{$c->url}">{$c->name}</a></li>
					{/if}
				{/foreach} 					
			</ul>
		</div>
	</div>
{/if}

<!--Каталог товаров-->
{if $products}
<div id="paramSelection">
	<a id="showFilter" href="#"><img alt="" src="design/{$settings->theme|escape}/images/1443780050_filter.png"> Фильтр по параметрам</a>
	
</div>

<div class="dropdown">
	<a class="currValue" href="#">
		{if $sort=='position'}
			По умолчанию
		{elseif $sort=='price'}
			По цене
		{elseif $sort=='name'}
			По названию
		{/if}
	</a>
<ul class="dropdownList">
	<li><a {if $sort=='position'}class="current"{/if} href="{url sort=position page=null}">По умолчанию</a></li>
	<li><a {if $sort=='price'}class="current"{/if} href="{url sort=price page=null}">По цене</a></li>
	<li><a {if $sort=='name'}class="current"{/if} href="{url sort=name page=null}"> ПО названию</a></li>
</ul>
</div>

<ul class="productList">
{foreach $products as $product}
	<li id="{$product->id}" class="product">
		<a data-product="{$product->id}" class="name" href="products/{$product->url}"><span>{$product->name|escape}</span></a>
		<table class="prTable">
			<tbody>
				<tr>
					<td>
						<a class="pic image" href="products/{$product->url}">
							{if $product->image}
								<img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}">
							{else}
								<img src="design/{$settings->theme|escape}/images/noimg.png" alt="{$product->name|escape}">
							{/if}
						</a>
					</td>
					<td>
						<a data-product="{$product->id}" class="title" href="products/{$product->url}"><span>{$product->name|escape}</span></a>
						<span class="price">
							<span class="pr">{$product->variant->price|convert}</span><span class="rouble"> {$currency->sign|escape}</span>
							{if $product->variant->compare_price > 0}<s>{$product->variant->compare_price|convert} <span class="rouble">{$currency->sign|escape}</span></s>{/if}
						</span>
						{if $product->variants|count > 0}
						<form class="variants" action="/cart">
							<span class="available">Товар есть в наличии</span>
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
			</tbody>
		</table>
	</li>
{/foreach}
</ul>
{include file='pagination.tpl'}
{else}
	Товары не найдены
{/if}	
		