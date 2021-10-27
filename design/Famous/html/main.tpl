{* Главная страница магазина *}

{* Для того чтобы обернуть центральный блок в шаблон, отличный от index.tpl *}
{* Укажите нужный шаблон строкой ниже. Это работает и для других модулей *}
{$wrapper = 'index.tpl' scope=parent}

{* Канонический адрес страницы *}
{$canonical="" scope=parent}

{include file='slider.tpl'}

<!-- service section -->
{include file='service.tpl'}




<!-- All products-->
<div class="container">
    {include file='main_tabs.tpl'}
</div>


<div class="inner-box">
    <div class="container">
        <div class="row">
            <!-- Banner -->
            <div class="col-md-3 top-banner hidden-sm">
                <div class="jtv-banner3">
                    {include file='banner_1.tpl'}
                </div>
            </div>
            <!-- Best Sale -->
            <div class="col-sm-12 col-md-9 jtv-best-sale special-pro">
                <div class="jtv-best-sale-list">
                    <div class="wpb_wrapper">
                        <div class="best-title text-left">
                            <h2>Акции и скидки</h2>
                        </div>
                    </div>
                    <div class="slider-items-products">
                        <div id="jtv-best-sale-slider" class="product-flexslider">
                            <div class="slider-items">
                                {* Акционные товары *}
                                {get_discounted_products var=discounted_products limit=8}
                                {if $discounted_products}
                                    {foreach $discounted_products as $product}
                                        {include file='product_block.tpl'}
                                    {/foreach}
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="banner-section">
    <div class="container">
        <div class="row">
            {include file='banner_2.tpl'}
        </div>
    </div>
</div>

<!-- Blog -->
<section class="blog-post-wrapper">
    <div class="container">
        <div class="best-title text-left">
            <h2>Новости</h2>
        </div>
        <div class="slider-items-products">
            <div id="latest-news-slider" class="product-flexslider hidden-buttons">
                <div class="slider-items slider-width-col6">
                    {* Выбираем в переменную $last_posts последние записи *}
                    {get_posts var=last_posts limit=10}
                    {foreach $last_posts as $post}
                    <div class="item">
                        <div class="blog-box">
                            <a href="blog/{$post->url}">
                                {if preg_match('/src="(.*?)"/i', $post->annotation, $matches)}
                                <img class="primary-img" src="{$matches[1]}" alt="{$post->name|escape}">
                                {/if}
                            </a>
                            <div class="blog-btm-desc">
                                <div class="blog-top-desc">
                                    <h5><a href="blog/{$post->url}">{$post->name|escape}</a></h5>
                                    <div class="jtv-entry-meta">
                                        <i class="fa fa-calendar"></i> <strong>{$post->date|date}</strong>
                                    </div>
                                </div>
                                <p>{$post->annotation|truncate:200|strip_tags}</p>
                                <a class="read-more" href="blog/{$post->url}"> Подробнее</a> </div>
                        </div>
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</section>


<!-- our clients Slider -->

<div class="container">
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <div class="our-clients">
                <div class="slider-items-products">
                    <div id="our-clients-slider" class="product-flexslider hidden-buttons">
                        <div class="slider-items slider-width-col6">
                            {* Выбираем в переменную $all_brands все бренды *}
                            {get_brands var=all_brands}
                            {if $all_brands}
                                {foreach $all_brands as $b}
                                    <div class="item">
                                        <a href="brands/{$b->url}">
                                            <img src="{$config->brands_images_dir}{$b->image}" alt="{$b->name|escape}">
                                        </a>
                                    </div>
                                {/foreach}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- BANNER-AREA-START -->
<section class="banner-area">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-lg-6 col-md-6">
                        {include file='banner_3.tpl'}
                    </div>
                    <div class="col-xs-12 col-sm-6 col-lg-6 col-md-6">
                        {include file='banner_4.tpl'}
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-4 col-lg-4 col-md-4">
                {include file='banner_5.tpl'}
            </div>
        </div>
    </div>
</section>
<!-- BANNER-AREA-END -->

<div class="main container">
    <div class="about-page">
        {* Тело страницы *}
        {$page->body}
    </div>
</div>

