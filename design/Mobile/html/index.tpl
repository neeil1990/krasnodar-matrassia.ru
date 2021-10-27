<!DOCTYPE html>
<html lang="ru">
	<head>
		<base href="{$config->root_url}/"/>
		<title>{$meta_title|escape}</title>
		
		{* Метатеги *}
		<meta charset="windows-1251">
		<meta name="description" content="{$meta_description|escape}" />
		<meta name="keywords"    content="{$meta_keywords|escape}" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		{* Канонический адрес страницы *}
		{if isset($canonical)}<link rel="canonical" href="{$config->root_url}{$canonical}"/>{/if}
		
		<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="icon" type="image/x-icon"/>
		<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="shortcut icon" type="image/x-icon"/>
		
		{* Стили *}
		<link href="design/{$settings->theme|escape}/css/styles.css" type="text/css"  data-template-style="true"  rel="stylesheet">
		{if $module=='ProductView'}
		<link href="design/{$settings->theme|escape}/css/product.css" type="text/css"  rel="stylesheet">
		{/if}
		{if $module=='ProductsView'}
		<link href="design/{$settings->theme|escape}/css/prodcts.css" type="text/css"  rel="stylesheet">
		{/if}
		{if $module=='CartView' || $module == 'OrderView'}
		<link href="design/{$settings->theme|escape}/css/cart.css" type="text/css"  rel="stylesheet">
		{/if}
	</head>
<body class="matrassia_ru_mobile">
	<div id="panel"></div>
	<div id="mainContainer">
		<div id="layout">
			<div id="header">
				<div class="wrapper">
					<!-- <a href="/" id="logo"><img src="design/{$settings->theme|escape}/images/logo.png" alt=""></a> -->
					<a href="/" id="logo"><img src="design/{$settings->theme|escape}/images/logo.png" title="{$settings->site_name|escape}" alt="{$settings->site_name|escape}"></a>

					<div class="right_block">
						<a class="tel_link" href="tel:+78612175954">+7 (861) 217-59-54</a>
                        {if $user}
							<a class="logged" href="/user" id="userCP"><img src="design/{$settings->theme|escape}/images/userIcoActive.png" alt="{$settings->site_name|escape}"></a>
                        {else}
							<a href="/user/login" id="userCP"><img src="design/{$settings->theme|escape}/images/userIco.png" alt="{$settings->site_name|escape}"></a>
                        {/if}
					</div>
				</div>

				<div id="topSearch">
					<div id="topSearchLine">
						<form action="products" method="GET" autocomplete="off" id="searchForm">
							<a href="#" id="menuTrigger"></a>
							<div class="wrapper">
								<table>
									<tr>
										<td><input type="text" name="keyword" value="{$keyword|escape}" class="input_search field" placeholder="Поиск по каталогу"></td>
										<td><a href="#" onclick="$(this).closest('form').submit()" class="btn" id="goTopSearch"><img src="design/{$settings->theme|escape}/images/searchElement2.png" alt="Искать"><span> Искать</span></a></td>
									</tr>
								</table>
							</div>
							<input type="hidden" name="r" value="Y">
						</form>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div id="content">
				<div class="wrapper">
					{$content}
				</div>
			</div>
			<div id="footer">
				<div class="wrapper">
					<table id="footHeader">
						<tr>
							<td>
							  <a href="/"><img src="design/{$settings->theme|escape}/images/logo2.png" alt=""></a>
								<p>Сеть интернет магазинов электроники и бытовой техники. График работы с 9:00 до 21:00</p>
								<a href="/?MobileVersion" class="mv">Мобильная версия сайта</a>
							</td>
							<td><a href="{url theme=$settings->theme_full}" id="fullSite">Полная версия</a></td>
						</tr>
					</table>
					<ul class="footerList">
						{foreach $pages as $p}
							{* Выводим только страницы из первого меню *}
							{if $p->menu_id == 1}
								<li><a data-page="{$p->id}" href="{$p->url}" {if $page && $page->id == $p->id}class="selected home"{/if}>{$p->name|escape}</a></li>
							{/if}
						{/foreach}
                        
                        {foreach $pages as $p}
                            {* Выводим страницы из второго меню, только Политику конфиденциальности *}
                            {if $p->menu_id == 2 && $p->id==12}
								<li><a {if $page && $page->id == $p->id}class="selected"{/if} data-page="{$p->id}" href="{$p->url}"><span>{$p->name|escape}</span></a></li>
                            {/if}
                        {/foreach}
					</ul>
				</div>
			</div>
			<!-- Корзина -->
			<span id="cart_informer">
				{include file='cart_informer.tpl'}
			</span>
			<!-- Корзина (The End)-->
		</div>

		<div id="navContainer">
			<a href="/catalog/" class="primaryButton">Каталог товаров</a>
			{*{if $categories}
				<ul id="leftMenu">
					{foreach $categories as $c}
						*}{* Показываем только видимые категории *}{*
						{if $c->visible}
							<li {if $category->id == $c->id}class="selected"{/if}>
								<a data-category="{$c->id}" href="catalog/{$c->url}">
									<ins>
										{if $c->image}
										<img src="{$config->categories_images_dir}{$c->image}" alt="{$c->name}">
										{/if}
										<span>{$c->name}</span>
									</ins>
								</a>
							</li>
						{/if}
					{/foreach}
				</ul>
			{/if}*}
            {function name=categories_tree level=1}
                {if $categories}
					<ul id="" class="categories_list level_{$level} {if $level > 1} categories_list_collapsed {/if}"
						style="padding-left: {$level*10}px;">
                        {foreach $categories as $c}
                            {* Показываем только видимые категории *}
                            {if $c->visible}
								<li class="categories_item level_{$level}">
									<a class="categories_link level_{$level}
                              {if $c->subcategories && $level > 1} categories_link_parent {/if}
                              {if $category->id == $c->id} selected {/if}"
									   href="catalog/{$c->url}" data-category="{$c->id}">
										<span>{$c->name}</span>
									</a>
									<div class="{if $c->subcategories && $level > 0} categories_link_parent_btn
                                {else} dn {/if}">
									</div>
                                    {categories_tree categories=$c->subcategories level=$level+1}
								</li>
                            {/if}
                        {/foreach}
					</ul>
                {/if}
            {/function}
            {categories_tree categories=$categories}
		</div>
		{if $category->brands || $features}
			<div id="filter">
				{include file='filter.tpl'}
			</div>
		 {/if} 
	<div id="inSku">
			<span class="heading">Выберите модификацию товара</span>
			<ul id="skuList"></ul>
		</div>

		<div id="backdrop">
			<a id="swClose">&times;</a>
		</div>
	</div>
	
{* JQuery *}	
<script type="text/javascript" src="design/{$settings->theme}/js/scripts.js"></script>
<script type="text/javascript"  src="design/{$settings->theme}/js/jquery-migrate-1.2.1.min.js"></script>

{* Всплывающие подсказки для администратора *}
{if $smarty.session.admin == 'admin'}
<script src ="js/admintooltip/admintooltip.js" type="text/javascript"></script>
<link   href="js/admintooltip/css/admintooltip.css" rel="stylesheet" type="text/css" /> 
{/if}

{* Ctrl-навигация на соседние товары *}
<script type="text/javascript" src="js/ctrlnavigate.js"></script> 

{* Аяксовая корзина *}
<script src="design/{$settings->theme}/js/jquery-ui.min.js"></script>
<script src="design/{$settings->theme}/js/ajax_cart.js"></script>

{* js-проверка форм *}
<script src="js/baloon/js/baloon.js" type="text/javascript"></script>
<link   href="js/baloon/css/baloon.css" rel="stylesheet" type="text/css" /> 

{if $products}
<script type="text/javascript" src="design/{$settings->theme}/js/filter.js"></script>
<script src="design/{$settings->theme}/js/jquery-ui-1.9.0.custom.min.js"  type="text/javascript"></script>
<script src="design/{$settings->theme}/js/filter.min.js"  type="text/javascript"></script>
{/if}

{if $product}
<script type="text/javascript" src="design/{$settings->theme}/js/product.js"></script>
{/if}

{if $module=='CartView'}
<script type="text/javascript" src="design/{$settings->theme}/js/cart.js"></script>
{/if}


{* Автозаполнитель поиска *}
{literal}
<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
<style>
.autocomplete-suggestions{
background-color: #ffffff;
overflow: hidden;
border: 1px solid #e0e0e0;
overflow-y: auto;
}
.autocomplete-suggestions .autocomplete-suggestion{cursor: default;}
.autocomplete-suggestions .selected { background:#F0F0F0; }
.autocomplete-suggestions div { padding:2px 5px; white-space:nowrap; }
.autocomplete-suggestions strong { font-weight:normal; color:#3399FF; }
</style>	
<script>
$(function() {
//  Автозаполнитель поиска
$(".input_search").autocomplete({
	serviceUrl:'ajax/search_products.php',
	minChars:1,
	noCache: false, 
	onSelect:
		function(suggestion){
			 $(".input_search").closest('form').submit();
		},
	formatResult:
		function(suggestion, currentValue){
			var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
			var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
			return (suggestion.data.image?"<img align=absmiddle src='"+suggestion.data.image+"'> ":'') + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>');
		}	
});
});
</script>
{/literal}

<script type="text/javascript">
	var LANG = {
		"SHOW_ALL"    :  "Показать все",
		"HIDE_ALL"    :  "Скрыть",
		};
</script>

{literal}
<!-- Yandex.Metrika counter --> <script type="text/javascript"> (function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter42315924 = new Ya.Metrika({ id:42315924, clickmap:true, trackLinks:true, accurateTrackBounce:true, webvisor:true }); } catch(e) { } }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = "https://mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); } })(document, window, "yandex_metrika_callbacks"); </script> <noscript><div><img src="https://mc.yandex.ru/watch/42315924" style="position:absolute; left:-9999px;" alt="" /></div></noscript> <!-- /Yandex.Metrika counter -->     
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-90791477-1', 'auto');
  ga('send', 'pageview');

</script> 
    
{/literal}
<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'SD7G3AYQGW';var d=document;var w=window;function l(){
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<!-- {/literal} END JIVOSITE CODE -->

</body>
</html>