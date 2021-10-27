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

<!-- Хлебные крошки /-->
<ul class="breadcrumb-navigation">
		<li><a href="/">Главная</a></li>
	{if $category}
	{foreach from=$category->path item=cat}
		<li><span class="ic1 multimage_icons next"></span></li> 
		<li><a href="catalog/{$cat->url}">{$cat->name|escape}</a></li>
	{/foreach}  
	{if $brand}
		<li><span class="ic1 multimage_icons next"></span></li>
		<li><a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a></li>
	{/if}
	{elseif $brand}
		<li><span class="ic1 multimage_icons next"></span></li>
		<li> <a href="brands/{$brand->url}">{$brand->name|escape}</a></li>
	{elseif $keyword}
	    <li><span class="ic1 multimage_icons next"></span></li>
		<li> Поиск</li>
	{/if}
	    <li><span class="ic2 multimage_icons"></span></li>
    <div class="clear"></div>
</ul>
<!-- Хлебные крошки #End /-->
<div class="clear"></div>
<div>
	<div class="clear"></div>
	<div class="around_catalog">
		<div class="catalog_sidebar">
			<div class="catalog_sidebar_inner">
				{foreach $categories as $c}
					{* Показываем только видимые категории *}
					{if $c->visible && in_array($category->id, $c->children) && $c->subcategories}                    
						<ul class="section_list">
							{foreach $c->subcategories as $cat}
								<li class="section_list-menu lvl1">
									<a class="sla a_lvl1 clearfix" href="catalog/{$cat->url}"><span class="imya">{$cat->name}</span>{if $cat->subcategories}<span class="icon multimage_icons"></span>{/if}</a>
									{if $cat->subcategories}
										<ul class="lvl1_submenu none2">
											{foreach $cat->subcategories as $cat2}
												<li  class="section_list-menu lvl2"><a class="sla a_lvl2 clearfix" href="catalog/{$cat2->url}"><span class="imya">{$cat2->name}</span></a></li>
											{/foreach}
										</ul>
									{/if}
								</li>
							{/foreach}
						</ul>
					{/if}
				{/foreach}                   
				{if $category->brands || $features}
					<div id="filter">{include file='filter.tpl'}</div>
				{/if}
				<!-- /smart.filter -->
			</div>
		</div>
		<div class="catalog">
			<div class="catalog_section_description">
				{* Заголовок страницы *}
				{if $keyword}
					<h1>Поиск {$keyword|escape}</h1>
				{elseif $page}
					<h1>{$page->name|escape}</h1>
				{else}
					<h1>{$category->name|escape} {$brand->name|escape} {$keyword|escape}</h1>
				{/if}
				<div class="descr">
					{if $current_page_num==1}                    
						{* Описание страницы (если задана) *}
						{$page->body}
						{* Описание бренда *}
						{$brand->description}
						{* Описание категории *}
						{$category->description}
					{/if}                   
				</div>
			</div>
			<!-- smart.filter [chosed] -->
			<!-- sorted and navigation -->
			<div class="around_sorter_and_navigation">
				{* Сортировка *}
				{if $products|count>0}                    
					{include file='pagination.tpl'}
					<!-- /pagenavigation -->
					<div id="catalog_sorter" class="catalog_sorter clearfix">
						<div class="personal-tabsheader">
							<div class="catalog_sorter-sort personal-tabsheader-tablink">
								<span class="catalog_sorter-name">Сортировать по:</span>
								<a class="incative {if $sort=='position'} select{/if}" href="{url sort=position page=null}">
									<span class="tabbg-center">умолчанию</span>
									<span class="img-cart multimage_icons"></span>
								</a>
								<a class="incative {if $sort=='name'} select{/if}" href="{url sort=name page=null}">
									<span class="tabbg-center">имени</span>
									<span class="img-cart multimage_icons"></span>
								</a>
								<a class="incative {if $sort=='price'} select{/if}" href="{url sort=price page=null}">
									<span class="tabbg-center">цене</span>
									<span class="img-cart multimage_icons"></span>
								</a>
							</div>
						</div>
					</div>
				{/if}                    
				<div class="clear"></div>
			</div>
			<!-- /sorted and navigation -->
			<div class="catalog_inner">
				<div id="ajaxpages_catalog_identifier" class="clearfix">
					<!--Каталог товаров-->
					{if $products}                  
						{foreach $products as $product}
							{include file='product_block.tpl'}
						{/foreach}
					{else}
						<p><font class="errortext">В данной категории товаров нет</font></p>
					{/if}
				</div>
			</div>
		</div>
	</div>
	<!-- /catalog -->
</div>
<!-- /content -->
<div class="clear"></div>