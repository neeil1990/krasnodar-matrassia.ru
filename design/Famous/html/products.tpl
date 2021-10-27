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

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    {if $category}
                        {foreach from=$category->path key=inc item=cat}
                            {if count($category->path) == $inc+1}
                                <li><strong>{$cat->name|escape}</strong></li>
                            {else}
                                <li><a href="catalog/{$cat->url}">{$cat->name|escape}</a><span>&raquo;</span></li>
                            {/if}
                        {/foreach}
                        {if $brand}
                            <li><a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a><span>&raquo;</span></li>
                        {/if}
                    {elseif $brand}
                        <li> <a href="brands/{$brand->url}">{$brand->name|escape}</a><span>&raquo;</span></li>
                    {elseif $keyword}
                        <li> Поиск</li>
                    {/if}
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->
<!-- Main Container -->
<div class="main-container col2-left-layout">
    <div class="container">
        <div class="row">
            <div class="col-main col-sm-9 col-xs-12 col-sm-push-3">
                {if $category->image}
                <div class="category-description std">
                    <div class="slider-items-products">
                        <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                            <div class="slider-items slider-width-col1 owl-carousel owl-theme">
                                <!-- Item -->
                                <div class="item">
                                    <a href="catalog/{$category->url}"><img alt="HTML template" src="/files/categories/{$category->image}"></a>
                                </div>
                                <!-- End Item -->
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
                <div class="shop-inner">
                    <div class="page-title">
                        {* Заголовок страницы *}
                        {if $keyword}
                            <h1>Результаты поиска по фразе "{$keyword|escape}" в мебельном интернет - магазине Матрассия</h1>
                        {elseif $page}
                            {if $category->description_head}
                                {$category->description_head}
                            {else}
                                {$category->name|escape}
                            {/if}
                        {else}
                            {if $category->description_head}
                                {$category->description_head}
                            {elseif $category->name|escape}
                                <h1>{$category->name|escape}</h1>
                            {else}
                                <h1>{$brand->name|escape} {$keyword|escape}</h1>
                            {/if}
                        {/if}
                    </div>

                    <div class="toolbar">
                        <div class="view-mode">
                            <ul>
                                <li class="active"> <a href="#"> <i class="fa fa-th-large"></i> </a> </li>
                            </ul>
                        </div>
                        <div class="sorter">
                            <div class="short-by">
                                <label>Сортировать по:</label>
                                <select>
                                    <option {if $sort=='position'} selected="selected"{/if} value="{url sort=position page=null}">умолчанию</option>
                                    <option {if $sort=='name'} selected="selected"{/if} value="{url sort=name page=null}">имени</option>
                                    <option {if $sort=='price'} selected="selected"{/if} value="{url sort=price page=null}">цене</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="product-grid-area">
                        <ul class="products-grid">
                            <!--Каталог товаров-->
                            {if $products}
                                {foreach $products as $product}
                                    <li class="item col-lg-4 col-md-4 col-sm-6 col-xs-6 ">
                                        {include file='product_block.tpl'}
                                    </li>
                                {/foreach}
                            {else}
                                <p><font class="errortext">В данной категории товаров нет</font></p>
                            {/if}
                        </ul>
                    </div>
                    {include file='pagination.tpl'}
                </div>
                {if $current_page_num==1}
                    <div class="description-bottom">
                        {* Описание страницы (если задана) *}
                        {$page->body}
                        {* Описание бренда *}
                        {if $brand && !$category}
                            {$brand->description}
                        {/if}
                        {* Описание категории *}
                        {$category->description}
                    </div>
                {/if}
            </div>
            <aside class="sidebar col-sm-3 col-xs-12 col-sm-pull-9">
                {if $category->brands || $features}
                <div class="block shop-by-side">
                    <div class="sidebar-bar-title">
                        <div class="h3">Категории</div>
                    </div>
                    <div class="block-content">
                        <div class="slider-range">
                            <div class="manufacturer-area">
                                <div class="saide-bar-menu">
                                    {foreach $categories as $c}
                                    {* Показываем только видимые категории *}
                                    {if $c->visible && in_array($category->id, $c->children) && $c->subcategories}
                                    <ul>
                                        {foreach $c->subcategories as $cat}
                                        <li><a href="{if empty($cat->subcategories)}catalog/{$cat->url}{else}javascript:void(0){/if}"><i class="fa fa-angle-right"></i> {$cat->name} </a>
                                            {if $cat->subcategories}
                                            <ul>
                                                {foreach $cat->subcategories as $cat2}
                                                <li><a href="catalog/{$cat2->url}">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right">&nbsp;</i>{$cat2->name}</a></li>
                                                {/foreach}
                                            </ul>
                                            {/if}
                                        </li>
                                        {/foreach}
                                    </ul>
                                    {/if}
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}

                {if $category->brands || $features}
                    <div id="filter">{include file='filter.tpl'}</div>
                {/if}
                <!-- /smart.filter -->

                <div class="block special-product">
                    <div class="sidebar-bar-title">
                        <div class="h3">Лучшие предложения</div>
                    </div>
                    <div class="block-content">
                        <ul>
                            {* Акционные товары *}
                            {get_discounted_products var=discounted_products limit=2}
                            {if $discounted_products}
                            {foreach $discounted_products as $product}
                            <li class="item">
                                <div class="products-block-left">
                                    <a href="products/{$product->url}" title="Sample Product" class="product-image">
                                        <img src="{$product->image->filename|resize:75:75}" alt="{$product->name|escape}">
                                    </a>
                                </div>
                                <div class="products-block-right">
                                    <p class="product-name">
                                        <a href="products/{$product->url}">{$product->name|escape}</a>
                                    </p>
                                    <span class="price">{$product->variant->price|convert} {$currency->sign|escape}</span>
                                </div>
                            </li>
                            {/foreach}
                            {/if}
                        </ul>
                    </div>
                </div>
                {include file="tags.tpl"}
            </aside>
        </div>
    </div>
</div>
<!-- Main Container End -->
