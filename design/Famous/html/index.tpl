<!DOCTYPE html>
<html>
<head>

	{include file="tag_head.tpl"}

	<!-- Basic page needs -->
	<base href="{$config->root_url}/"/>
	<meta charset="utf-8">
	<!--[if IE]>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<![endif]-->
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>{$meta_title|escape}</title>
	<meta name="description" content="{$meta_description|escape}" />
	<meta name="keywords"    content="{$meta_keywords|escape}" />
	<meta name="google" content="clean template, electronics Store, html5, electronics template, makeup store, modern, multipurpose store, electronics shop, commerce, ecommerce, electronics, electronics theme, megamenu, modern, retail, store"/>

	{* Канонический адрес страницы *}
	{if isset($canonical)}<link rel="canonical" href="{$config->root_url}{$canonical}"/>{/if}

	<!-- Mobile specific metas  -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicons Icon -->
	<link rel="shortcut icon" type="image/x-icon" href="design/{$settings->theme|escape}/images/favicon.ico">

	<!-- CSS Style -->
	<link rel="stylesheet" href="design/{$settings->theme|escape}/style.css">
	<link rel="stylesheet" href="design/{$settings->theme|escape}/js/alertifyjs/css/alertify.min.css">
	<link rel="stylesheet" href="design/{$settings->theme|escape}/js/alertifyjs/css/themes/default.min.css">
	
	{include file="collector_top.tpl"}
</head>
{if $module == 'MainView'}
<body class="cms-index-index cms-home-page">
{else}
<body class="shop_grid_page">
{/if}

{include file="tag_body.tpl"}



<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- mobile menu -->
<div id="mobile-menu">
	<ul>
		{if $categories}
		{foreach  item=c from=$categories}
		{* Показываем только видимые категории *}
		{if $c->visible}
		<li><a href="catalog/{$c->url}">{$c->name}</a>
			<ul>
				{if $c->subcategories}
				{foreach item=cat from=$c->subcategories}
				{* Показываем только видимые категории *}
				{if $cat->visible}
				<li><a href="catalog/{$cat->url}" class="">{$cat->name}</a>
					<ul>
						{if $cat->subcategories}
						{foreach $cat->subcategories as $cat3}
						{* Показываем только видимые категории *}
						{if $cat3->visible}
						<li><a href="catalog/{$cat3->url}">{$cat3->name}</a></li>
						{/if}
						{/foreach}
						{/if}
					</ul>
				</li>
				{/if}
				{/foreach}
				{/if}
			</ul>
		</li>
		{/if}
		{/foreach}
		{/if}

		{foreach $pages as $p}
		{* Выводим только страницы из первого меню *}
		{if $p->menu_id == 1}
		<li><a href="{$p->url}">{$p->name|escape}</a></li>
		{/if}
		{/foreach}
	</ul>
</div>
<!-- end mobile menu -->
<div id="page">

	<!-- Header -->
	<header>
		<div class="header-container">
			<div class="header-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-xs-12">
							<!-- Default Welcome Message -->
							<div class="welcome-msg hidden-xs hidden-sm">
								Время работы интернет-магазина |
								без выходных 9:00-20:00 |
								Магазин Пн-Пт 10:00-19:00
							</div>
						</div>

						<!-- top links -->
						<div class="headerlinkmenu col-md-6 col-sm-6 col-xs-12">
							<span class="phone  hidden-xs hidden-sm">Адрес: {$settings->street_shop|escape}</span>
							<ul class="links">
								{if $user}
									<li>
										<a title="login" href="user">
											<span>
												<i class="fa fa-user fa-sm"></i>
												{$user->name} {if $group->discount>0},ваша скидка &mdash; {$group->discount}%{/if}
											</span>
										</a>
									</li>
									<li><a title="Выйти" href="user/logout"><span>Выйти</span></a></li>
								{else}
									<li><a title="Регистрация" href="/user/register"><span>Регистрация</span></a></li>
									<li><a title="Авторизация" href="/user/login"><span>Авторизация</span></a></li>
								{/if}
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- header inner -->
			<div class="header-inner">
				<div class="container">
					<div class="row">
						<div class="col-sm-3 col-xs-12 jtv-logo-block">

							<!-- Header Logo -->
							<div class="logo"><a title="e-commerce" href="/"><img alt="Famous" title="Famous" src="design/{$settings->theme|escape}/images/logo.png"></a> </div>
						</div>
						<div class="col-xs-12 col-sm-5 col-md-3">
							<div class="top-phone">
								<div class="link-phone">
									<a href="tel:{$settings->phone|escape}">
										<i class="icon-call-in icons"></i>
										<span>{$settings->phone|escape}</span>
									</a>
								</div>
							</div>
							<div class="order-call">
								<a href="#" data-toggle="modal" data-target="#shop-popup" data-metrika="{$settings->metrika|escape}" data-goal="Zakazat-zvonok" data-whatever="Заказать звонок!">Заказать звонок!</a>
							</div>
						</div>
						<div class="col-xs-12 col-sm-5 col-md-3">

							<!-- Search -->

							<div class="top-search">
								<div>
									<form action="products" id="search">
										<div class="input-group">
											<input id="title-search-input" type="text" class="input_search form-control" type="text" name="keyword" value="{$keyword|escape}"  maxlength="50"  placeholder="Поиск по сайту">
											<button class="btn-search" type="submit"><i class="fa fa-search"></i></button>
										</div>
									</form>
								</div>
							</div>

							<!-- End Search -->

						</div>
						<div class="col-xs-12 col-sm-4 col-md-3 top-cart">
							<div class="link-wishlist" id="compare_informer">
								{include file='compare_informer.tpl'}
							</div>
							<!-- top cart -->
							<div class="top-cart-contain">
								<div class="mini-cart" id="cart_informer">
									{* Обновляемая аяксом корзина должна быть в отдельном файле *}
									{include file='cart_informer.tpl'}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->
	<nav>
		<div class="container">
			<div class="row">
				<div class="mm-toggle-wrap">
					<div class="mm-toggle"><i class="fa fa-align-justify"></i> </div>
					<span class="mm-label">Категории</span> </div>
				<div class="col-md-3 col-sm-3 mega-container hidden-xs">
					<div class="navleft-container">
						<div class="mega-menu-title">
							<h3><span>Категории</span></h3>
						</div>
						<!-- Shop by category -->
						<div class="mega-menu-category">
							<ul class="nav">
							{if $categories}
								{foreach  item=c from=$categories}
								{* Показываем только видимые категории *}
									{if $c->visible}
									<li><a href="catalog/{$c->url}">{$c->name}</a>
										<div class="wrap-popup">
											<div class="popup">
												<div class="row">
													{if $c->subcategories}
													{$arrSubCat = array_chunk($c->subcategories,ceil(count($c->subcategories)/3))}
													{for $foo=0 to count($arrSubCat)-1}
														<div class="col-md-4 col-sm-6 {if $foo > 0}has-sep{/if}">
														{foreach item=cat from=$arrSubCat[$foo]}
														{* Показываем только видимые категории *}
														{if $cat->visible}
															<a href="catalog/{$cat->url}"><div class="h3">{$cat->name}</div></a>
															<ul class="nav">
																{if $cat->subcategories}
																{foreach $cat->subcategories as $cat3}
																{* Показываем только видимые категории *}
																{if $cat3->visible}
																<li class=""><a href="catalog/{$cat3->url}">{$cat3->name}</a></li>
																{/if}
																{/foreach}
																{/if}
															</ul>
															<br>
														{/if}
														{/foreach}
														</div>
													{/for}
													{/if}
												</div>
											</div>
										</div>
									</li>
									{/if}
								{/foreach}
							{/if}
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 jtv-megamenu">
					<div class="mtmegamenu">
						<ul class="hidden-xs">
							{foreach $pages as $p}
							{* Выводим только страницы из первого меню *}
								{if $p->menu_id == 1}
								<li class="mt-root {if $page && $page->id == $p->id}selected{/if}">
									<div class="mt-root-item">
										<a href="{$p->url}">
											<div class="title title_font">
												<span class="title-text">{$p->name|escape}</span>
											</div>
										</a>
									</div>
								</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
	{$content}

	{if $module != 'MainView'}
	<!-- service section -->
		{include file='service.tpl'}
	{/if}
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 col-xs-12">
					<div class="footer-logo"><a href="index.html"><img src="design/{$settings->theme|escape}/images/footer-logo.png" alt="fotter logo"></a> </div>
					<p><i class="fa fa-map-marker" aria-hidden="true"></i> <b>{$settings->company_name|escape}</b></p>
					<p>Ортопедические матрасы. Кровати. Шкафы-купе. Мебель для спальни и гостиной.</p>
					<p><a style="color: #999;" href="tel:{$settings->phone|escape}">{$settings->phone|escape}</a></p>
					<div class="social">
						<ul class="inline-mode">
							<li class="social-network fb"><a title="ПРИСОЕДИНЯЙТЕСЬ" href="https://vk.com/matrassia" target="_blank"><i class="fa fa-vk"></i></a></li>
							<li class="social-network instagram"><a title="ПРИСОЕДИНЯЙТЕСЬ" href="https://www.instagram.com/matrassia/" target="_blank"><i class="fa fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-md-2 col-xs-12 collapsed-block">
					<div class="footer-links">
						<div class="h5 links-title">Товары<a class="expander visible-xs" href="#TabBlock-1">+</a></div>
						<div class="tabBlock" id="TabBlock-1">
							<ul class="list-links list-unstyled">
								{if $categories}
								{foreach $categories as $c}
								{* Показываем только видимые категории *}
								{if $c->visible}
								<li><a href="catalog/{$c->url}">{$c->name|escape}</a></li>
								{/if}
								{/foreach}
								{/if}
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-2 col-xs-12 collapsed-block">
					<div class="footer-links">
						<div class="h5 links-title">ДОПОЛНИТЕЛЬНО<a class="expander visible-xs" href="#TabBlock-3">+</a></div>
						<div class="tabBlock" id="TabBlock-3">
							<ul class="list-links list-unstyled">
								{foreach $pages as $p}
									{if $p->menu_id == 1}
										<li><a href="{$p->url}">{$p->name|escape}</a></li>
									{/if}
								{/foreach}
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-2 col-xs-12 collapsed-block">
					<div class="footer-links">
						<div class="h5 links-title">Сервис<a class="expander visible-xs" href="#TabBlock-4">+</a></div>
						<div class="tabBlock" id="TabBlock-4">
							<ul class="list-links list-unstyled">
								<li><a title="Регистрация" href="/user/register"><span>Регистрация</span></a></li>
								<li><a title="Авторизация" href="/user/login"><span>Авторизация</span></a></li>
								{foreach $pages as $p}
									{if $p->menu_id == 2 && $p->id==12}
										<li><a href="{$p->url}">{$p->name|escape}</a></li>
									{/if}
								{/foreach}
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-xs-12 collapsed-block">
					<div class="footer-links">
						<div class="h5 links-title">Время работы<a class="expander visible-xs" href="#TabBlock-5">+</a></div>
						<div class="tabBlock" id="TabBlock-5">
							<div class="footer-description">Интернет-магазина.</div>
							<div class="footer-description"> <b>без выходных</b> 9:00 - 20:00<br></div>
							<div class="footer-description">Магазин.</div>
							<div class="footer-description"><b>Пн - Пт</b> 10:00 - 19:00</div>
							<div class="payment">
								<ul>
									<li><a href="#"><img title="Visa" alt="Visa" src="design/{$settings->theme|escape}/images/visa.png"></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-coppyright">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 col-xs-12 coppyright">© {date('Y')}  Все права защищены. Информация сайта защищена законом об авторских правах. Вся информация на сайте носит справочный характер и не является публичной офертой. </div>
				</div>
			</div>
		</div>
	</footer>
	<a href="#" id="back-to-top" title="Back to top"><i class="fa fa-angle-up"></i></a>

	<!-- End Footer -->
</div>

{include file="popup.tpl"}

<!-- JS -->

<!-- jquery js -->
<script src="design/{$settings->theme|escape}/js/jquery.min.js"></script>

<!-- bootstrap js -->
<script src="design/{$settings->theme|escape}/js/bootstrap.min.js"></script>

<!-- owl.carousel.min js -->
<script src="design/{$settings->theme|escape}/js/owl.carousel.min.js"></script>

<!--cloud-zoom js -->
<script src="design/{$settings->theme|escape}/js/cloud-zoom.js"></script>

<!-- flexslider js -->
<script src="design/{$settings->theme|escape}/js/jquery.flexslider.js"></script>

<!-- jquery.mobile-menu js -->
<script src="design/{$settings->theme|escape}/js/mobile-menu.js"></script>

<!--jquery-ui.min js -->
<script src="design/{$settings->theme|escape}/js/jquery-ui.js"></script>

<!-- alertify js -->
<script src="design/{$settings->theme|escape}/js/alertifyjs/alertify.min.js"></script>

<!-- maskinput js -->
<script src="design/{$settings->theme|escape}/js/jquery.maskinput.js"></script>

<!-- main js -->
<script src="design/{$settings->theme|escape}/js/main.js"></script>

<!-- countdown js -->
<script src="design/{$settings->theme|escape}/js/countdown.js"></script>


<!-- Slider Js -->
<script src="design/{$settings->theme|escape}/js/revolution-slider.js"></script>
<script src="design/{$settings->theme|escape}/js/filter.min.js"></script>

   
{* Слайдер Fotorama *}
<link  href="//cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>



{* Автозаполнитель поиска *}
{literal}
	<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>

	<style>
		.autocomplete-suggestions
		{
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


<script>
	$(function() {
		$('#rev_slider_4').show().revolution({
			dottedOverlay: 'none',
			delay: 5000,
			startwidth: 865,
			startheight: 450,

			hideThumbs: 200,
			thumbWidth: 200,
			thumbHeight: 50,
			thumbAmount: 2,

			navigationType: 'thumb',
			navigationArrows: 'solo',
			navigationStyle: 'round',

			touchenabled: 'on',
			onHoverStop: 'on',

			swipe_velocity: 0.7,
			swipe_min_touches: 1,
			swipe_max_touches: 1,
			drag_block_vertical: false,

			spinner: 'spinner0',
			keyboardNavigation: 'off',

			navigationHAlign: 'center',
			navigationVAlign: 'bottom',
			navigationHOffset: 0,
			navigationVOffset: 20,

			soloArrowLeftHalign: 'left',
			soloArrowLeftValign: 'center',
			soloArrowLeftHOffset: 20,
			soloArrowLeftVOffset: 0,

			soloArrowRightHalign: 'right',
			soloArrowRightValign: 'center',
			soloArrowRightHOffset: 20,
			soloArrowRightVOffset: 0,

			shadow: 0,
			fullWidth: 'on',
			fullScreen: 'off',

			stopLoop: 'off',
			stopAfterLoops: -1,
			stopAtSlide: -1,

			shuffle: 'off',

			autoHeight: 'off',
			forceFullWidth: 'on',
			fullScreenAlignForce: 'off',
			minFullScreenHeight: 0,
			hideNavDelayOnMobile: 1500,

			hideThumbsOnMobile: 'off',
			hideBulletsOnMobile: 'off',
			hideArrowsOnMobile: 'off',
			hideThumbsUnderResolution: 0,


			hideSliderAtLimit: 0,
			hideCaptionAtLimit: 0,
			hideAllCaptionAtLilmit: 0,
			startWithSlide: 0,
			fullScreenOffsetContainer: ''
		});
	});
</script>

	{include file="collector_bottom.tpl"}
</body>
</html>
