<!DOCTYPE html>
{*
	Общий вид страницы
	Этот шаблон отвечает за общий вид страниц без центрального блока.
*}
<html>
<head>
	<base href="{$config->root_url}/"/>
	<title>{$meta_title|escape}</title>
	
	{* Метатеги *}
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width">	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="{$meta_description|escape}" />
	<meta name="keywords"    content="{$meta_keywords|escape}" />
    <meta name="it-rating" content="it-rat-1d674945dd1fe863a3409ed2f27767e7" />
	<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="icon"          type="image/x-icon"/>
	<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="shortcut icon" type="image/x-icon"/>
	
	{* Канонический адрес страницы *}
	{if isset($canonical)}<link rel="canonical" href="{$config->root_url}{$canonical}"/>{/if}
	
	{* Стили *}
	<link href="design/{$settings->theme|escape}/css/jquery.fancybox.css" type="text/css" rel="stylesheet">
    <link href="design/{$settings->theme|escape}/css/jquery.jscrollpane.css" type="text/css" rel="stylesheet">
    <link href="design/{$settings->theme|escape}/css/glass.css" type="text/css" rel="stylesheet">
    <link href="design/{$settings->theme|escape}/css/style.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="design/{$settings->theme|escape}/css/template_styles.css" type="text/css" rel="stylesheet">
    <link href="design/{$settings->theme|escape}/css/simpla.css" rel="stylesheet" type="text/css" media="screen"/>

    {* JQuery *}
	<script src="js/jquery/jquery.js"  type="text/javascript"></script>
	
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/jquery.jscrollpane.min.js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/glass.js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/script(1).js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/iefix.js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/script(2).js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/script(3).js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/script(5).js"></script>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/script(6).js"></script>
	{if $module == 'MainView'}
	<link href="design/{$settings->theme|escape}/css/banners.css" rel="stylesheet" type="text/css" media="screen"/>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/banners.js"></script>
	{/if}
	{if $module == 'ProductView' || $module == 'BlogView'}
	<link href="design/{$settings->theme|escape}/css/product.css" rel="stylesheet" type="text/css" media="screen"/>
	<script type="text/javascript" src="design/{$settings->theme|escape}/js/product.js"></script>
	{/if}
{literal}
<script type="text/javascript">
// some JS params
var RSAL_SITE_DIR = '/',
	RSAL_ClickProtectionDelay = 1500,
	RSAL_RequestDelay = 250,
	RSAL_FancyCloseDelay = 1200,
	RSAL_FancyReloadPageAfterClose = false,
	RSAL_PRICE_CODE = '',
	RSAL_OFFERS = new Object(),
	RSAL_LIKES = {},
	RSAL_COMPARE = {},
	RSAL_INBASKET = {},
	RSAL_PHONETABLET = "N",
	RSAL_SHOW_MOUSE_LOADING = "Y";
if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) { RSAL_PHONETABLET = "Y"};
// messages
BX.message({"RSAL_JS_TO_MACH_CLICK_LIKES":"Вы слишком часто кликаете, отдохните немного!"});
</script>
<style type="text/css">.fancybox-margin{margin-right:17px;}</style>	
{/literal}	
	
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
	
	{* Автозаполнитель поиска *}
	{literal}
	<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>

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
		<script type="text/javascript" src="design/{$settings->theme}/js/catalog.js"></script>
		<link href="design/{$settings->theme|escape}/css/menu.catalog.css" type="text/css" rel="stylesheet" />
		<script src="design/{$settings->theme}/js/jquery-ui-1.9.0.custom.min.js"  type="text/javascript"></script>
        <script src="design/{$settings->theme}/js/filter.min.js"  type="text/javascript"></script>
		
		{* Стравнение товаров *}
		<script src="design/{$settings->theme}/js/ajax_compare.js"></script>
		{if $product}
		{else}
		<script src="design/{$settings->theme}/js/catalog.compare.result.js"></script>
		{/if}
		<link href="design/{$settings->theme|escape}/css/catalog.compare.result.css" type="text/css" rel="stylesheet" />
		<link href="design/{$settings->theme|escape}/css/catalog.compare.list.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script>
		{if $product}
		<script type="text/javascript" charset="utf-8" src="/buyme/js/buyme.js"></script>
		{/if}
		{if $products}
		{else}
		{* Обратный звонок *}
		<script> var cm_bt = 0; </script>
		<script type="text/javascript" src="/callme/js/callme.js"></script>
		<script> var bm_lang = "ru"; </script>
		{/if}
</head>
	<body class="activelife ru matrassia_ru">
		<div id="panel"></div>
		{if $module == 'MainView'}
			<div class="body tab">
				{include file='slider_images.tpl'}
		{else}
			<div class="body pc">
		{/if}
				<div class="wrap">
					<div id="top_panel" class="top_panel back3">
						<div class="wrap_inside clearfix">
							<div class="menu_top_panel clearfix">
								{foreach $pages as $p}
									{* Выводим только страницы из первого меню *}
									{if $p->menu_id == 1}
										<div class="menu_top_panel-item">
											<a {if $page && $page->id == $p->id}class="selected"{/if} data-page="{$p->id}" href="{$p->url}">{$p->name|escape}</a>
										</div>
									{/if}
								{/foreach}
							</div>
							<div class="auth_top_panel">
								<div class="auth_top_panel-separator"></div>
								{if $user}
									<div class="auth_top_panel-item js-personal_menu auth_top_panel-padding_right">
										<a href="user">
											<i class="icon multimage_icons auth_top_panel-lichkab"></i>
											<span id="basket_top_panel-info">{$user->name} {if $group->discount>0},ваша скидка &mdash; {$group->discount}%{/if}</span>
										</a>
									</div>
									<div class="auth_top_panel-separator"></div>
									<div id="auth_top_panel-item_exit" class="auth_top_panel-item">
										<a href="user/logout"><i class="icon multimage_icons auth_top_panel-auth"></i>Выйти</a>
									</div>								
								{else}
									<div class="auth_top_panel-item js-personal_menu auth_top_panel-padding_right">
										<a class="js_fancy_window" href="#registration">
											<i class="icon multimage_icons auth_top_panel-lichkab"></i>
											<span id="basket_top_panel-info">Регистрация</span>
										</a>
									</div>
									<div class="auth_top_panel-separator"></div>
									<div id="auth_top_panel-item_exit" class="auth_top_panel-item">
										<a class="js_fancy_window" href="#fancyauth">
											<i class="icon multimage_icons auth_top_panel-auth"></i>
											Авторизоваться
										</a>
									</div>			
								{/if}              
							</div>
						</div>
					</div>
        <div id="header" class="header">
			<div class="wrap_inside clearfix">
				<div class="header-info">
					<div class="basket_top_panel js_basket_top_panel clearfix">
						<a class="basket_top_panel_overlay" href="cart/"></a>
						<div class="basket_top_panel-icon multimage_icons"></div>
						<!-- Корзина -->
						<div class="basket_top_panel-text" id="cart_informer">
							{* Обновляемая аяксом корзина должна быть в отдельном файле *}
							{include file='cart_informer.tpl'}
						</div>
						<!-- Корзина (The End)-->
					</div>
					<div class="header-info-logo_and_phones clearfix">
						<div class="header-info-logo">
							<a href=""><img src="design/{$settings->theme|escape}/images/logo.png" border="0" title="{$settings->site_name|escape}" alt="{$settings->site_name|escape}"></a>
						</div>
						
						<div class="header-info-phones">
						    <div class="header-info-times-p1">
						        <div class="">
						            Время работы интернет-магазина <br>
						            без выходных 9:00-20:00
						        </div>
						        <div class="">
						            Магазин Пн-Пт 10:00-19:00
						        </div>
						    </div>
							<div class="header-info-phones-p1">
								<div class="header-info-phones-recall">
									<a rel="nofollow" class="callme_viewform" href="#"><i class="icon multimage_icons"></i>Заказать звонок</a>
									<div class="clear"></div>
								</div>
								+7 (861) 217-59-54
							</div>

                            &nbsp; &nbsp; &nbsp; &nbsp;
							<div class="header-info-phones-p2">
								<div class="header-info-phones-feedback">
									<a rel="nofollow" class="js_fancy_window" href="#fancyfeedback"><i class="icon multimage_icons"></i>Обратная связь</a>
									<div class="clear"></div>
								</div>
								ул. Суздальская, 1
							</div>

						</div>
					</div>
				</div>
				<div class="header-menu_and_search back0">
						<div class="search_in_head">
							<div class="search_in_head-input" id="title-search">
								<form action="products" id="search">
									<i class="icon multimage_icons search_in_head-search_icon" onclick="document.getElementById('search').submit()"></i>
									<input id="title-search-input" type="text" class="input_search text" type="text" name="keyword" value="{$keyword|escape}"  maxlength="50"  placeholder="Поиск по сайту">
								</form>
							</div>
						</div>
					<!-- /search_in_head -->
					<div id="menu_catalog" class="menu_catalog clearfix">
						{if $categories}
							<div class="lvl1 li_excess_item">
                                <a class="a_lvl1 a_excess_item" href="#">
                                    <span class="excess_font">• • •</span>
                                </a>
								<div class="submenu_lvl1 submenu_lvl1_excess none2">
									<a class="a_lvl1 asub_excess_item" href="#"><span class="excess_font">• • •</span></a>
									<div class="submenu_excess_item_inner">
										{foreach item=c from=$categories}
											{* Показываем только видимые категории *}
											{if $c->visible}
												<a class="asub_excess_links section_id_{$c->id}" id="section_id_{$c->id}" href="catalog/{$c->url}" style="display:none;">{$c->name}</a>
											{/if}
										{/foreach}	
									</div>
								</div>
							</div> 
						{/if}
						{if $categories}
							{foreach  item=c from=$categories}
								{* Показываем только видимые категории *}
								{if $c->visible}
									<div class="lvl1">
										<a class="a_lvl1 section_id_{$c->id}" id="section_id_{$c->id}"  data-category="{$c->id}" title="{$c->name}" href="catalog/{$c->url}">{$c->name}</a>
										{if $c->subcategories}
											{foreach item=cat from=$c->subcategories}
												{* Показываем только видимые категории *}
												{if $cat->visible}
													<div class="lvl2">
														<a class="a_lvl2" data-category="{$cat->id}" href="catalog/{$cat->url}">{$cat->name}</a>
															{if $cat->subcategories}
																{foreach $cat->subcategories as $cat3}
																	{* Показываем только видимые категории *}
																	{if $cat3->visible}
																		<div class="lvl3"><a class="a_lvl3" data-category="{$cat3->id}" href="catalog/{$cat3->url}" title="{$cat3->name}">{$cat3->name}</a></div>
																	{/if}
																{/foreach}
															{/if}
													</div>
												{/if}
											{/foreach}
										{/if}				
										{if !$c@last}
											<div class="lvl1_separator multimage_icons"></div>                   
										{/if}                                     																								 
									</div>
								{/if}
							{/foreach}															
						{/if}
						<div class="clear"></div>
					 </div>
					<!-- /menu_catalog -->
				</div>
			</div>
        </div>
        <div class="wrap_inner">
			<div class="wrap_inside clearfix">
				<div id="content">{$content}</div>
				<!-- /content -->
				<div class="clear"></div>
			</div>
          <!-- /wrap_inside -->
        </div>
        <!-- /wrap_inner -->
        <div id="footer" class="footer">
			<div class="wrap_inner">
				<div class="wrap_inside clearfix">
					<div id="footer" class="footer_inner clearfix">
						<div class="footer-block block1">
							<div class="footer-logo">
								<a href="">
									<img src="design/{$settings->theme|escape}/images/logo_foot.png" border="0" title="{$settings->site_name|escape}" alt="{$settings->site_name|escape}">
								</a>
							</div>
							<div class="footer-phones">
								<div class="footer-phones-p1">
									  <div class="footer-phones-recall">
										<a rel="nofollow" class="callme_viewform" href="#">
										  <i class="icon multimage_icons"></i>Заказать звонок</a>
									  </div>
									  +7 (861) 217-59-54
								</div>

                                &nbsp; &nbsp; &nbsp; &nbsp;
								<div class="footer-phones-p2">
									<div class="footer-phones-feedback">
										<a rel="nofollow" class="js_fancy_window" href="#fancyfeedback"><i class="icon multimage_icons"></i>Обратная связь</a>
									</div>
									{* 8-800-700-22-22 *}
								</div>

							</div>
						</div>
						<div class="footer-block block2">
							<div class="infootercatalog ellipsisnames clearfix">
								<div class="infootercatalog-title footer-title">Товары</div>
									{if $categories}
										{foreach $categories as $c}
											{* Показываем только видимые категории *}
											{if $c->visible}                 
												<div class="infootercatalog-aroundlevel">
													<div class="infootercatalog-item depth_level1">
														<a {if $category->id == $c->id}class="selected"{/if} href="catalog/{$c->url}" data-category="{$c->id}"><span>{$c->name|escape}</span></a>
													</div>
													{if $c->subcategories}
														{foreach $c->subcategories as $cat}
															{if $cat->visible && $cat@iteration < 5}
																<div class="infootercatalog-item depth_level2">
																	<a {if $category->id == $cat->id}class="selected"{/if} href="catalog/{$cat->url}" data-category="{$cat->id}"><span>{$cat->name|escape}</span></a>						
																</div>
															{/if}
														{/foreach}                     
													{/if}
												</div>
											{/if}
										{/foreach}                                      
									{/if}                    
							</div>
						</div>
						<div class="footer-block block3">
							<div class="menu_in_footer clearfix">
								<div class="menu_in_footer-title footer-title">Дополнительно</div>
								{foreach $pages as $p}
									{* Выводим только страницы из первого меню *}
									{if $p->menu_id == 1}
										<div class="menu_in_footer-item"><a {if $page && $page->id == $p->id}class="selected"{/if} data-page="{$p->id}" href="{$p->url}"><span>{$p->name|escape}</span></a></div>
									{/if}
								{/foreach}
                                {foreach $pages as $p}
                                    {* Выводим страницы из второго меню, только Политику конфиденциальности *}
                                    {if $p->menu_id == 2 && $p->id==12}
										<div class="menu_in_footer-item"><a {if $page && $page->id == $p->id}class="selected"{/if} data-page="{$p->id}" href="{$p->url}"><span>{$p->name|escape}</span></a></div>
                                    {/if}
                                {/foreach}
							</div>
								</div>
						<div class="footer-block block4">
							<div class="footer-socservice">
								<div style="margin-bottom:25px;">
									<div style="font-size:14px;font-weight:bold;text-transform:uppercase;color:#165181; margin-bottom:3px;">Присоединяйтесь</div>
                                    <a href="https://vk.com/krasnodarmatrassia" target="_blank"><img src="design/{$settings->theme|escape}/images/icon_vk.png" border="0" alt=""></a>
                                    {*
									<a href="#"><img src="design/{$settings->theme|escape}/images/icon_fb.png" border="0" alt=""></a>
									<a href="#"><img src="design/{$settings->theme|escape}/images/icon_tw.png" border="0" alt=""></a>
                                    *}
								</div>
                            
                            	<div class="footer-phones-p1">
									  <div class="footer-phones-recall">
										<a href="{url theme=$settings->theme_mobile}"  rel="nofollow">
										  <i class="icon multimage_icons"></i> Мобильная версия</a>
									  </div>
								</div>
							</div>
						</div>
					</div>
				<!-- /footer_inner -->
				</div>
            <!-- /wrap_inside -->
			</div>
          <!-- /wrap_inner -->
          <div class="footer-copyright">
            <div class="wrap_inner">
              <div class="wrap_inside clearfix">
                <div class="footer-copyright-podpis">
                  <a href="./" target="_blank">©</a> Все права защищены. Информация сайта защищена законом об авторских правах. Вся информация на сайте носит справочный характер и не является публичной офертой.
                </div>
                {*
                <div class="footer-copyright-site_developer">Powered by 
                  <a href="http://www.simpla-template.org.ua/" target="_blank"><b>www.Simpla-Template.org.ua</b></a>
                </div>
                *}
              </div>
              <!-- /wrap_inside -->
            </div>
            <!-- /wrap_inner -->
          </div>
          <!-- /footer-copyright -->
        </div>
        <!-- /footer -->
      </div>
      <!-- /wrap -->
    </div>
    <!-- /body -->
    <!------------------------ fancybox - auth ------------------------>
    <div id="fancyauth" style="display:none;">
      <div id="comp_57bd40fdf47db6c238b2755d92d8f1fa">
        <div class="popup styleforsmallpopup auth_form">
          <div class="popup_head back0">Авторизация
          </div>
          <div class="popup_dashed">
            <div id="auth_form_popup" class="popup_body clearfix">
              <form method="post" action="user/login" >
				<input class="textinput40 back1" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}" maxlength="50" placeholder="Email">
                <div class="user_password">
                  <input class="textinput40 back1" type="password"  name="password" data-format=".+" data-notice="Введите пароль" value=""  maxlength="50" placeholder="Пароль">
                  <a href="user/password_remind">Забыли?</a>
                </div>
                <div class="clearfix">
                  <a class="btn2 submit" href="#">Войти</a>
                  <input class="none1" type="submit" name="login" value="Войти">
                  <div class="remember">
                  </div>
                </div>
              </form>
            </div>
            <div class="popup_foot">
              <a class="js_fancy_window" href="#registration" >Регистрация</a>
            </div>
          </div>
        </div>
      </div>

    </div>

    <!------------------------ recall ------------------------>
      <div id="fancyrecall" style="display:none;">
        <div id="comp_b403038af04aedbec00a672b66a1ee73">
          <div class="popup styleforsmallpopup">
            <div class="popup_head back0">Заказать звонок
            </div>
            <div class="popup_dashed">
              <div id="recall2_popup" class="popup_body">
                <!--'start_frame_cache_recall2_popup'-->
                <form action="design/{$settings->theme|escape}/images/Оплата.html" method="POST">
                  <input type="hidden" name="bxajaxid" id="bxajaxid_b403038af04aedbec00a672b66a1ee73_8BACKi" value="b403038af04aedbec00a672b66a1ee73">
                  <input type="hidden" name="AJAX_CALL" value="Y">
				  <input type="hidden" name="sessid" id="sessid" value="27e22ad8c08a07e2e38817fb555e5576">
                  <input type="hidden" name="redsign_recall2" value="Y">
                  <input type="hidden" name="PARAMS_HASH" value="f40edaeae7f88359ce0c7846de64be87">
                  <input class="textinput40 back1" type="text" name="RS_AUTHOR_NAME" value="" placeholder="Ваше имя">
                  <br>
                  <input class="textinput40 back1" type="text" name="RS_AUTHOR_PHONE" value="" placeholder="Номер телефона">
                  <br>
                  <input class="textinput40 back1 textinput_captcha" type="text" name="captcha_word" size="30" maxlength="50" value="">
                  <div class="captcha">
                  <img class="captcha_image" src="design/{$settings->theme|escape}/images/captcha.php" width="180" height="39" alt="CAPTCHA">
                  </div>
                  <a class="btn2 submit clear" href="#">Перезвонить</a>
                  <input class="none1" type="submit" name="submit" value="Перезвонить">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

	<!------------------------ feedback ------------------------>
	<div id="fancyfeedback" style="display:none;">
		<div>
			<div class="popup styleforsmallpopup">
			  <div class="popup_head back0">Обратная связь
			  </div>
			  <div class="popup_dashed">
				<div id="feedback_popup" class="popup_body">
				  <form action="contact" method="POST">
					<input class="textinput40 back1" type="text" data-format=".+" data-notice="Введите имя" value="{$name|escape}" name="name" placeholder="Ваше имя">
					<br>
					<input class="textinput40 back1" type="text"  data-format="email" data-notice="Введите email" value="{$email|escape}" name="email" placeholder="Ваш E-mail">
					<br>
					<textarea class="textinput40 back1" placeholder="Сообщение" data-format=".+" data-notice="Введите сообщение" value="{$message|escape}" name="message">{$message|escape}</textarea>
					<br>
					<div class="captcha">
					<input class="textinput40 back1 textinput_captcha" type="text" size="30" maxlength="50" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу" >
					<img class="captcha_image"  src="captcha/image.php?{math equation='rand(10,10000)'}"  alt="CAPTCHA">
					</div>
					<a class="btn2 submit clear" href="#">Отправить</a>
					<input class="none1" type="submit" name="feedback" value="Отправить">
				  </form>
				</div>
			  </div>
			</div>
		</div>
	</div>

	<!------------------------ compare ------------------------>
	{if $module == 'CompareView'}
	{if $compare->total>0}
	<div style="display:block;" id="popupcomparelist">
		<div style="width:56px;" class="catalog_compare_list">
			<form method="get" action="/compare/">
				<div class="scroll_comparelist_ clearfix">
				{foreach $compare->products as $product}
					<a href="compare/remove/{$product->id}" class="catalog_compare_list-item">
						<div class="catalog_compare_list-item-pic">
							<img alt="" title="{$product->name|escape}" src="{$product->image|resize:50:50}">
						</div>
						<div href="/compare/" class="icon multimage_icons catalog_compare_list-item-del"></div>
						<input type="hidden" value="90" name="ID[]" class="compare_element_id">
					</a>
				{/foreach}
				</div>
				{if $compare_informer->total>1}
				<a href="#" class="submit btn2">Сравнить</a>
				<input type="submit" value="Сравнить" class="none1 go2compareresult"><input type="hidden" value="COMPARE" name="action"><input type="hidden" value="6" name="IBLOCK_ID">
			{/if}
			</form>
		</div>
	</div>
	{/if}
	{else}
	<div id="compare_informer" >
		{if $compare->total>0}
		<div id="cat_compare_fixed">
			<div style="display:block;" id="popupcomparelist">
				<div style="width:56px;" class="catalog_compare_list">
					<form method="get" action="/compare/">
						<div class="scroll_comparelist_ clearfix">
							<a href="compare/remove/{$product->id}" class="catalog_compare_list-item">
								<div class="catalog_compare_list-item-pic">
									<a style="font-size: 45px; font-weight: bold; text-decoration: none;" rel="nofollow" title="" href="/compare/" class="cat_compare_fixed-item_link">{$compare_informer->total}</a>
								</div>
							</a>
						</div>
						{if $compare_informer->total>1}
						<a href="#" class="submit btn2">Сравнить</a>
						<input type="submit" value="Сравнить" class="none1 go2compareresult"><input type="hidden" value="COMPARE" name="action"><input type="hidden" value="6" name="IBLOCK_ID">
						{/if}
					</form>
				</div>
			</div>
		</div>
		{/if}
	</div>
	{/if}
	
	<!------------------------ /compare ------------------------>
	<div id="registration"  style="display: none;">
		<div>
			<div class="popup styleforsmallpopup">
				<div class="popup_head back0">Регистрация</div>
				{if $error}
				<div class="message_error">
					{if $error == 'empty_name'}Введите имя
					{elseif $error == 'empty_email'}Введите email
					{elseif $error == 'empty_password'}Введите пароль
					{elseif $error == 'user_exists'}Пользователь с таким email уже зарегистрирован
					{elseif $error == 'captcha'}Неверно введена капча
					{else}{$error}{/if}
				</div>
				{/if}
				<div class="popup_dashed">
					<div class="popup_body">
						<form  name="regform" action="/user/register" method="post">
							<input type="text" placeholder="Введите имя" value="{$name|escape}" data-notice="Введите имя" name="name" data-format=".+" class="textinput40 back1"><br>
							<input type="password" placeholder="Пароль" autocomplete="off" type="password" name="password" data-format=".+" data-notice="Введите пароль"  class="textinput40 back1"><br>
							<input type="text" placeholder="Адрес e-mail" name="email" data-format="email" data-notice="Введите email" value="{$email|escape}" class="textinput40 back1"><br>
							<div style="margin-bottom: 10px" class="clearfix"></div>
							<input type="text" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу" class="textinput40 back1 textinput_captcha">
							<div class="captcha"><img class="captcha_image" alt="CAPTCHA" src="captcha/image.php?{math equation='rand(10,10000)'}"/></div> 
							<a href="#" class="btn2 submit clear">Регистрация</a>
							<input type="submit" value="Регистрация" name="register" class="none1">
						</form>
					</div>
					<div class="popup_foot">
						<a class="js_fancy_window" href="#fancyauth" >Авторизация</a>
					</div>
				</div>
			</div>
		</div>
	</div>
   
{literal}
<!-- Yandex.Metrika counter --> <script type="text/javascript"> (function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter47528356 = new Ya.Metrika({ id:47528356, clickmap:true, trackLinks:true, accurateTrackBounce:true, webvisor:true }); } catch(e) { } }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = "https://mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); } })(document, window, "yandex_metrika_callbacks"); </script> <noscript><div><img src="https://mc.yandex.ru/watch/47528356" style="position:absolute; left:-9999px;" alt="" /></div></noscript> <!-- /Yandex.Metrika counter -->     
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-90791477-1', 'auto');
  ga('send', 'pageview');

</script>     
     <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-90791477-5"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-90791477-5');
</script>

{/literal}

<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'SD7G3AYQGW';var d=document;var w=window;function l(){
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<!-- {/literal} END JIVOSITE CODE -->
  
</body>
</html>