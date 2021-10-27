{* Страница товара *}

{* Канонический адрес страницы *}
{$canonical="/products/{$product->url}" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    {foreach from=$category->path key=inc item=cat}
                            <li><a href="catalog/{$cat->url}">{$cat->name|escape}</a><span>&raquo;</span></li>
                    {/foreach}
                   
                    <li><strong>{$product->name|escape}</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->

<meta itemprop="availability" href="http://schema.org/InStock" content="В наличии">
<!-- Main Container -->
<div class="main-container col1-layout">
    <div class="container" itemscope itemtype="http://schema.org/Product">
        <meta itemprop="mpn" content="{$product->id}">
        <div class="row">
            <div class="col-main">
                <div class="product-view-area">

                    {get_brands var=brand}
                    {foreach $brand as $b}
                        {if $b->id === $product->brand_id}
                            <meta itemprop="brand" content="{$b->name}">
                            {break}
                        {/if}
                    {/foreach}

                    {*if $product->images}
                        <div class="product-big-image col-xs-12 col-sm-5 col-lg-5 col-md-5">
                            <div class="icon-sale-label sale-left">Sale</div>
                            <div class="large-image">
                                {if $product->image}
                                <a href="{$product->image->filename|resize:400:400}" itemprop="image" class="cloud-zoom" id="zoom1" rel="useWrapper: false, adjustY:0, adjustX:20">
                                    <img class="zoom-img" src="{$product->image->filename|resize:400:400}" alt="{$product->name|escape}">
                                </a>
                                {/if}
                                </div>
                            <div class="flexslider flexslider-thumb">
                                <ul class="previews-list slides">
                                    {foreach $product->images as $i=>$image}
                                    <li>
                                        <a href='{$image->filename|resize:400:400}' itemprop="image" class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '{$image->filename|resize:400:400}' ">
                                            <img src="{$image->filename|resize:80:80}" alt = "{$product->name|escape}"/>
                                        </a>
                                    </li>
                                    {/foreach}
                                </ul>
                            </div>
                            <!-- end: more-images -->
                        </div>
                    {/if*}

                    <div class="product-big-image col-xs-12 col-sm-5 col-lg-5 col-md-5">
						<div class="fotorama"
							data-width="100%"
							data-ratio="720/480"
							data-arrows="always"
							data-nav="thumbs"
							data-thumbwidth="80"
							data-thumbheight="53"
							data-allowfullscreen="true"
							data-thumbborderwidth="1"
							data-keyboard="true"
							data-loop="true">
								{if $product->image}
									<a href="{$product->image->filename|resize:400}"><img src="{$product->image->filename|resize:80}" alt="{$product->product->name|escape}" /></a>
								{else}
									<img src="design/{$settings->theme|escape}/images/nofoto.jpg" alt="Нет фотографии" />
								{/if}
								{if $product->images|count>1}
									{* cut удаляет первую фотографию, если нужно начать 2-й - пишем $product->images|cut:2 и тд *}
									{foreach $product->images|cut as $i=>$image}
										<a href="{$image->filename|resize:400}"><img src="{$image->filename|resize:80}" alt="{$product->name|escape}" /></a>
									{/foreach}
								{/if}
						</div>
                    </div>

                    <div class="col-xs-12 col-sm-7 col-lg-7 col-md-7 prod product-details-area">
                        <div class="product-name">
                            <h1 itemprop="name">{$product->name|escape}</h1>
                        </div>
                        {if $product->variants|count > 0}
	                        <div class="price-box" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
	                            <link itemprop="availability" href="http://schema.org/InStock"/>
	                            <meta itemprop="priceValidUntil" content="4019-01-01">
	                            <meta itemprop="url" content="{$smarty.server.REQUEST_SCHEME}://{$smarty.server.HTTP_HOST}/products/{$product->url|escape}">
	                            <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" itemprop="price" content="{$product->variant->price}"> {$product->variant->price|convert} {$currency->sign|escape}</span> </p>
	                            {if $product->variant->compare_price > 0}
	                            <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" itemprop="price" content="{$product->variant->compare_price}"> {$product->variant->compare_price|convert} {$currency->sign|escape}</span> </p>
	                            {/if}
	                            <meta itemprop="priceCurrency" content="RUB">
	                        </div>
	                        {if $middle_rating}
	                        <div class="ratings" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
	                            <div class="rating">
	                                {for $stars=1 to 5}
	                                    {if $stars <= $middle_rating}
	                                        <i class="fa fa-star"></i>
	                                    {else}
	                                        <i class="fa fa-star-o"></i>
	                                    {/if}
	                                {/for}
	                            </div>
	                            <meta itemprop="ratingValue" content="{$middle_rating}"/>
	                            <p class="rating-links">
	                                <a href="#">
	                                    <span itemprop="reviewCount">
	                                        {count($comments)}
	                                    </span>
	                                    Отзыва(ов)
	                                </a>
	                            </p>
	                        </div>
	                        {/if}
	                        <form class="js-buyform variants2" name="buy_form" action="cart">
	                            <div class="product-color-size-area">
	                                <div class="size-area">
	                                    <div class="h2 saider-bar-title">Вариант</div>
	                                    <div class="size">
	                                        {* Не показывать выбор варианта, если он один и без названия *}
	                                        <select name="variant" {if $product->variants|count==1  && !$product->variant->name}style='display:none;'{/if}>
	                                            {foreach $product->variants as $v}
	                                                <option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"  discount="{($v->compare_price-$v->price)|convert}"{/if} price="{$v->price|convert}">
	                                                    {$v->name}
	                                                </option>
	                                            {/foreach}
	                                        </select>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="product-variation">
	                                <form action="#" method="post">
	                                    <div class="cart-plus-minus">
	                                        <label for="qty">Количество:</label>
	                                        <div class="numbers-row">
	                                            <div onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) result.value--;return false;" class="dec qtybutton"><i class="fa fa-minus">&nbsp;</i></div>
	                                            <input type="text" class="qty" title="Qty" value="1" maxlength="12" id="qty" name="amount">
	                                            <div onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="inc qtybutton"><i class="fa fa-plus">&nbsp;</i></div>
	                                        </div>
	                                    </div>
	                                    <button class="button pro-add-to-cart" title="Add to Cart" type="submit"><span><i class="fa fa-shopping-basket"></i> В корзину</span></button>
	                                </form>
	                            </div>
	                        </form>
	                    {else}
	                    	<div class="alert alert-info text-center">
		                    	<h3>{$settings->phone|escape}</h3>
		                    	<p><span class="btn btn-default btn-lg disabled">По запросу</span></p>
	                    	</div>
                        {/if}

                        <div class="product-alerts">
                            <div class="row">
                                <div class="col-md-6 col-xs-12 col-sm-12">
                                    <div class="alertymes4 blue" data-toggle="modal" data-target="#shop-popup" data-metrika="{$settings->metrika|escape}" data-goal="Consult" data-whatever="Консультация">
                                        <i class="fa fa-thumbs-up fa-lg"></i> Консультация {$settings->phone|escape}
                                    </div>
                                </div>

                                <div class="col-md-6 col-xs-12 col-sm-12">
                                    <div class="alertymes4" data-toggle="modal" data-target="#shop-popup" data-metrika="{$settings->metrika|escape}" data-goal="Nashli-deshevle" data-whatever="Нашли дешевле?">
                                        <i class="fa fa-thumbs-up fa-lg"></i> Нашли дешевле? Сделаем скидку!
                                    </div>
                                </div>

                                <div class="col-md-6 col-xs-12 col-sm-12">
                                    <div class="alertymes4 blue" data-toggle="modal" data-target="#shop-popup" data-metrika="{$settings->metrika|escape}" data-goal="Bystraya-dostavka" data-whatever="Быстрая доставка">
                                        <i class="fa fa-truck fa-lg"></i> Быстрая доставка
                                    </div>
                                </div>

                                <div class="col-md-6 col-xs-12 col-sm-12">
                                    <div class="alertymes4 blue" data-toggle="modal" data-target="#shop-popup" data-metrika="{$settings->metrika|escape}" data-goal="Kupit-1-click" data-whatever="Купить в 1 клик">
                                        <i class="fa fa-thumbs-up fa-lg"></i> Купить в 1 клик
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="product-cart-option">
                            <ul>
                                <li><a href="#" class="add_to_compare" data-id="{$product->id}"><i class="fa fa-link"></i><span>Добавить в сравнение</span></a></li>
                                <li><a href="#" data-toggle="modal" data-target="#shop-popup" data-metrika="{$settings->metrika|escape}" data-goal="Zakazat-zvonok" data-whatever="Заказать звонок!"><i class="fa fa-envelope"></i><span>Заказать звонок</span></a></li>
                            </ul>
                        </div>

                        <div class="short-description">
                            <div class="page-title">
                                <div class="h2">Характеристики</div>
                            </div>
                            <table class="table table-bordered cart_summary">
                                {foreach $product->features as $f}
                                <tr itemprop="sku">
                                    <td>{$f->name}</td>
                                    <td data-title="E-Mail" >{$f->value}</td>
                                </tr>
                                {/foreach}
                            </table>
                        </div>
                        <div class="pro-tags">
                            <div class="pro-tags-title">Теги:</div>
                            {if $product->meta_keywords}
                                {foreach from=explode(",",$product->meta_keywords) key=k item=tags name=tag}
                                    <a href="products?keyword={$tags}"> {$tags}</a>
                                    {if $smarty.foreach.tag.last == false},{/if}
                                {/foreach}
                            {/if}
                        </div>
                        <div class="share-box">
                            <div class="title">Мы в соцсетях</div>
                            <div class="socials-box">
                                <a href="https://vk.com/matrassia" target="_blank"><i class="fa fa-vk"></i></a>
                                <a href="https://www.instagram.com/matrassia/" target="_blank"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="product-overview-tab">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="product-tab-inner">
                                <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                                    <li class="active"> <a href="#description" data-toggle="tab"> Описание </a> </li>
                                    <li> <a href="#reviews" data-toggle="tab">Отзывы</a> </li>
                                    <li> <a href="#delivery" data-toggle="tab">Доставка</a> </li>
                                </ul>
                                <div id="productTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="description">
                                        <div class="std" itemprop="description">
                                            {$product->body}
                                        </div>
                                    </div>
                                    <div id="reviews" class="tab-pane fade">


                                        {if $comments}

                                            <div class="single-box">

                                                <div class="comment-list">
                                                    <ul>
                                                        {foreach $comments as $comment}
                                                        <li itemprop="review" itemscope itemtype="http://schema.org/Review">
                                                            <div class="avartar">
                                                                <img src="design/{$settings->theme|escape}/images/avatar.png" alt="Avatar"> </div>
                                                            <div class="comment-body">
                                                                <div class="comment-meta">
                                                                    <span class="author" itemprop="author" itemscope itemtype="http://schema.org/Person">
                                                                        <a href="#" itemprop="name" content="{$comment->name|escape}">{$comment->name|escape}</a>
                                                                    </span>
                                                                    <span class="date" itemprop="datePublished" content="{$comment->date|date}">{$comment->date|date}, {$comment->date|time}</span>
                                                                </div>
                                                                {if $comment->rating}
                                                                <div class="ratings" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
                                                                    <div class="rating">
                                                                        {for $stars=1 to 5}
                                                                            {if $stars <= $comment->rating}
                                                                                <i class="fa fa-star"></i>
                                                                            {else}
                                                                                <i class="fa fa-star-o"></i>
                                                                            {/if}
                                                                        {/for}
                                                                    </div>
                                                                    <meta itemprop="ratingValue" content="{$comment->rating}">
                                                                    <p class="rating-links">
                                                                        <a href="#">Рейтинг товара</a>
                                                                    </p>
                                                                </div>
                                                                {/if}
                                                                <div class="comment">
                                                                    {if !$comment->approved}
                                                                        <div class="alert alert-success" role="alert">Ожидает модерации</div>
                                                                    {/if}

                                                                    {if $comment->pluses_text}
                                                                        <div class="h5">Плюсы</div>
                                                                        <p>{$comment->pluses_text|escape|nl2br}</p>
                                                                        <br>
                                                                    {/if}

                                                                    {if $comment->minuses_text}
                                                                        <div class="h5">Минусы</div>
                                                                        <p>{$comment->minuses_text|escape|nl2br}</p>
                                                                        <br>
                                                                    {/if}

                                                                    {if $comment->text}
                                                                        <div class="h5" itemprop="itemReviewed">Отзыв</div>
                                                                        <p itemprop="reviewBody">{$comment->text|escape|nl2br}</p>
                                                                        <br>
                                                                    {/if}


                                                                    {if $comment->image}
                                                                    <div class="row">
                                                                        <div class="col-xs-6 col-md-3">
                                                                            <a href="{$comment->image|resize:800:600}" target="_blank" class="thumbnail">
                                                                                <img src="{$comment->image|resize:250:250}" alt="{$comment->name|escape}">
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    {/if}

                                                                </div>
                                                            </div>
                                                        </li>
                                                        {/foreach}
                                                    </ul>
                                                </div>
                                            </div>

                                        {/if}

                                        <div class="col-sm-12 col-lg-12 col-md-12">
                                            <div class="best-title text-left">
                                                <div class="h2">Оставить отзыв</div>
                                            </div>

                                            <div class="reviews-content-right">
                                                <br>
                                                <form enctype="multipart/form-data" method="post">
                                                    {if $error}
                                                        <div class="alert alert-danger" role="alert">
                                                            <i class="fa fa-exclamation-circle fa-lg"></i>
                                                            {if $error=='empty_name'}
                                                                Введите имя
                                                            {elseif $error=='empty_captcha'}
                                                                Укажите галочку что вы не робот
                                                            {elseif $error=='empty_comment'}
                                                                Введите комментарий
                                                            {/if}
                                                        </div>
                                                    {/if}
                                                    <div class="reviews-table">
                                                        <table>
                                                            <tbody>
                                                            <tr>
                                                                <th>1 звезда</th>
                                                                <th>2 звезды</th>
                                                                <th>3 звезды</th>
                                                                <th>4 звезды</th>
                                                                <th>5 звезд</th>
                                                            </tr>
                                                            <tr>
                                                                <td><input name="rating" type="radio" value="1"></td>
                                                                <td><input name="rating" type="radio" value="2"></td>
                                                                <td><input name="rating" type="radio" value="3"></td>
                                                                <td><input name="rating" type="radio" value="4"></td>
                                                                <td><input name="rating" type="radio" value="5" checked="checked"></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="form-area">
                                                        <div class="form-element">
                                                            <label>Ваше имя <em>*</em></label>
                                                            <input type="text" name="name" placeholder="Ваше имя" value="{$comment_name}">
                                                        </div>
                                                        <div class="form-element">
                                                            <label>Плюсы <em>*</em></label>
                                                            <input type="text" name="pluses_text" placeholder="Преимущества" value="{$comment_pluses_text}">
                                                        </div>
                                                        <div class="form-element">
                                                            <label>Минусы <em>*</em></label>
                                                            <input type="text" name="minuses_text" placeholder="Недостатки" value="{$comment_minuses_text}">
                                                        </div>
                                                        <div class="form-element">
                                                            <label>Отзыв <em>*</em></label>
                                                            <textarea name="text">{$comment_text}</textarea>
                                                        </div>
                                                        <div class="form-element">
                                                            <label>Фото вашего товара </label>
                                                            <input type="file" name="image">
                                                        </div>
                                                        <div class="form-element">
                                                            <label>Проверка </label>
                                                            <div class="g-recaptcha" data-sitekey="6LdEGpkUAAAAAIHWxn3qzWWUsQOBMA4jRcijT80a"></div>
                                                        </div>
                                                        <div class="buttons-set">
                                                            <button class="button submit" name="comment" title="Оставить отзыв" type="submit" value="Отправить"><span><i class="fa fa-thumbs-up"></i> &nbsp;Оставить отзыв</span></button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="delivery">
                                        <div class="product-tabs-content-inner clearfix">
                                            {$product->annotation}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Main Container End -->

<!-- Related Product Slider -->
{* Связанные товары *}
{if $related_products}
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="related-product-area">
                <div class="page-header">
                    <div class="h2">Так же советуем посмотреть</div>
                </div>
                <div class="related-products-pro">
                    <div class="slider-items-products">
                        <div id="related-product-slider" class="product-flexslider hidden-buttons">
                            <div class="slider-items slider-width-col4 fadeInUp">
                                {foreach $related_products as $product}
                                    {include file='product_block.tpl'}
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}
<!-- Related Product Slider End -->
