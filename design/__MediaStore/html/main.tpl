{* Главная страница магазина *}

{* Для того чтобы обернуть центральный блок в шаблон, отличный от index.tpl *}
{* Укажите нужный шаблон строкой ниже. Это работает и для других модулей *}
{$wrapper = 'index.tpl' scope=parent}

{* Канонический адрес страницы *}
{$canonical="" scope=parent}


{include file='slider_buttons.tpl'}



              <!-- brands and sections -->
              <div class="catalog-element-tabs maintabs js_tabs">
                <div class="personal-tabsheader js_tabs_header">
                  <div class="personal-tabsheader-tablink">
                    <a rel="nofollow" class="incative select" href="#tab_sport_view">
                      <span class="tabbg-center">Товары
                      </span>
                      <span class="img-cart multimage_icons">
                      </span></a>
                    <a rel="nofollow" class="incative" href="#tab_brands">
                      <span class="tabbg-center ">Бренды
                      </span>
                      <span class="img-cart multimage_icons">
                      </span></a>
                    <div class="clear">
                    </div>
                  </div>
                  <div class="clear">
                  </div>
                </div>
                <div class="personal-tabscontent">
                  <div id="tab_sport_view" class="tabs-content js_tabs_content showed">
                    <div class="main_slider sections_slider" data-itemw="128" data-showintime="9" data-slideon="8">
                      <a class="main_slider-arrow_prev icon multimage_icons disabled" href="#"></a>
                      <div class="main_slider-slider">
                        <div class="main_slider-slider_inner clearfix" style="width:1408px;" data-count="{$categories|count}">
                         			{foreach $categories as $c}
				{* Показываем только видимые категории *}
				{if $c->visible}   
                          <a class="main_slider-item" href="catalog/{$c->url}">
                            <div class="main_slider-item-image">
                            {if $c->image}<img src="{$config->categories_images_dir}{$c->image}" alt="{$c->name|escape}">{/if}
                            </div>
                            <div class="main_slider-item-name text_fader">{$c->name|escape}
                            </div></a>
              {/if}
              {/foreach}              

                        </div>
                      </div>
                      <a class="main_slider-arrow_next icon multimage_icons" href="#"></a>
                    </div>
                  </div>
                  <div id="tab_brands" class="tabs-content js_tabs_content">
                    <div class="main_slider brands_slider" data-itemw="192" data-showintime="6" data-slideon="5">
                      <a class="main_slider-arrow_prev icon multimage_icons disabled" href="#"></a>
                      <div class="main_slider-slider">
			<!-- Все бренды -->
			{* Выбираем в переменную $all_brands все бренды *}
			{get_brands var=all_brands}
			{if $all_brands}                    
                        <div class="main_slider-slider_inner clearfix" style="width:2880px;" data-count="{ $all_brands|count}">
                        {foreach $all_brands as $b}	
						<a class="main_slider-item" href="brands/{$b->url}" title="{$b->name|escape}">
                            <div class="main_slider-item-image">
                            {if $b->image}
                              <img src="{$config->brands_images_dir}{$b->image}" alt="{$b->name|escape}" />
                            {else}
                            {$b->name|escape}
                            {/if}
                            </div></a>
                          {/foreach}	  
                        </div>
                        {/if}
                      </div>
                      <a class="main_slider-arrow_next icon multimage_icons" href="#"></a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /brands and sections -->

            </div>
            <!-- /content -->
          </div>
          <!-- /wrap_inside -->
        </div>
        <!-- /wrap_inner -->
        <div class="mainfullline">
        </div>
        <div class="wrap_inner">
          <!-- wrap_inner -->
          <div class="wrap_inside">
            <!-- wrap_inside -->
            <div id="content">
              <!-- content -->
             <div class="newsmain">
				<div class="newsmain_inner">
				<div class="newsmain-item-iblock_name"><a title="Новости" href="/blog"><H3>Новости</h3></a></div><br><br>
					{* Выбираем в переменную $last_posts последние записи *}
					{get_posts var=last_posts limit=10}
					{foreach $last_posts as $post}
					 <div id="bx_4665576_{$post->id}" class="newsmain-item">
						<div class="newsmain-item-name">
							<a title="{$post->name|escape}" href="blog/{$post->url}"><b>{$post->name|escape}</b></a>
						 </div>
						 <div class="newsmain-item-iblock_name">{$post->date|date}</div>
						<div class="newsmain-item-pic">{$post->annotation|truncate:200} <a title="{$post->name|escape}" href="blog/{$post->url}">  Далее→</a> </div>
						</div>
						{/foreach}                  
				</div>
			</div>
              <!-- banners -->
              <div class="main_adv_banners clearfix">
<div id="bxdynamic_page_home_adv">
<div class="main_adv_banners-banner">
<a href="#" target="_blank">
<img alt="Баннер 3" title="Баннер 3" src="design/{$settings->theme|escape}/images/b1.png" width="315" height="153" border="0"></a>
</div>
<div class="main_adv_banners-banner">
<a href="#" target="_blank">
<img alt="Баннер 3" title="Баннер 3" src="design/{$settings->theme|escape}/images/b2.png" width="315" height="153" border="0"></a>
</div>
<div class="main_adv_banners-banner">
<a href="#" target="_blank">
<img alt="Баннер 3" title="Баннер 3" src="design/{$settings->theme|escape}/images/b3.png" width="315" height="153" border="0"></a>
</div>
</div>
              </div>
              <!-- /banners -->
             
              <div id="bxdynamic_page_home_tabs">
              {include file='main_tabs.tpl'}
              </div>
              <div class="clear">
              </div>
              <!-- /tabs -->
              <div class="main_bot_banners">
                <div class="main_bot_banners-banner">
                  <a href="#" title="Баннер 1">
                    <img src="design/{$settings->theme|escape}/images/banner1.png" alt=""  title="" /></a>
                </div>
                <div class="main_bot_banners-banner">
                  <a href="#" title="Баннер 2">
                    <img src="design/{$settings->theme|escape}/images/banner2.png" alt=""  title="" /></a>
                </div>
                <div class="main_bot_banners-banner">
                  <a href="#" target="_blank" title="Баннер 3">
                    <img src="design/{$settings->theme|escape}/images/banner3.png" alt=""  title="" /></a>
                </div>
                <div class="main_bot_banners-banner">
                  <a href="#" title="Баннер 4">
                    <img src="design/{$settings->theme|escape}/images/banner4.png" alt=""  title="" /></a>
                </div>
              </div>             

            <div class="clear">
            </div> 
              

{* Тело страницы *}
{$page->body}
