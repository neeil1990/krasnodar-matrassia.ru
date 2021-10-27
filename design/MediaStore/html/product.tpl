{* Страница товара *}

{* Канонический адрес страницы *}
{$canonical="/products/{$product->url}" scope=parent}

<!-- Хлебные крошки /-->
<ul class="breadcrumb-navigation">
		<li><a href="./">Главная</a></li>
	{foreach from=$category->path item=cat}
		<li><span class="ic1 multimage_icons next"></span></li>
		<li><a href="catalog/{$cat->url}">{$cat->name|escape}</a></li>
	{/foreach}
	{if $brand}
		<li><span class="ic1 multimage_icons next"></span></li>
		<li><a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a></li>
	{/if}
		<li><span class="ic1 multimage_icons next"></span></li>
		<li>{$product->name|escape}</li>
		<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>                
</ul>
<!-- Хлебные крошки #End /-->
<div>
	<div class="catalog-element js-detailpage js-element  js-element-id{$product->variant->id} b1c-name {if $product->featured}da{/if} {if $product->variant->compare_price > 0}qb{/if}" data-elementid="{$product->variant->id}">
		<div class="catalog-element_inner clearfix">
				<div class="catalog-element-left">
					<div class="catalog-element-gen_image-around">
						<table class="catalog-element-gen_image">
							<tbody>
								<tr>
									<td>
										<div class="catalog-element-mainimage">
											<a class="qb_corner"></a>
											<a class="da_corner"></a>
											<div class="glass">
												{if $product->image}
												<img class="image_for_watch js_picture_glass" src="{$product->image->filename|resize:800:600}" alt="{$product->name|escape}" title="{$product->name|escape}">
												<div class="glass_lupa"></div>
												{/if}
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div data-showintime="5" data-itemw="100" class="catalog-element-extimages main_slider">
						<a href="#" class="catalog-element-extimages_arrow_prev icon multimage_icons disabled main_slider-arrow_prev {if $product->images|count<5}little{/if}" rel="nofollow"></a>
						<div class="catalog-element-extimages_slider main_slider-slider">
							<div data-count="{$product->images|count}" style="width:{$product->images|count * 100}px;" class="catalog-element-extimages_slider_inner main_slider-slider_inner clearfix">
								<span class="selected_block"><span class="arrow icon multimage_icons"></span></span>
								{foreach $product->images as $i=>$image}
								<div class="around_image offer_img offer83">
									<a rel="nofollow" class="image" href="{$image@iteration-1}" data-bigimagesrc="{$image->filename|resize:800:600}">
										<img src="{$image->filename|resize:80:80}"  alt="{$product->name|escape}" />
									</a>
								</div>
								{/foreach}
							</div>
						</div>
						<a href="#" class="catalog-element-extimages_arrow_next icon multimage_icons main_slider-arrow_next main_slider-arrow_next {if $product->images|count<5}little{/if}" rel="nofollow"></a>
					</div>
				</div>
			<div class="catalog-element-right">
				<div class="catalog-element-head">
					<div class="catalog-element-head_left">
						{if $product->variant->sku}
							<div class="catalog-element-artikul">Артикул: {$product->variant->sku}</div>
						{/if}
						<div class="catalog-element-name"><h1 data-product="{$product->id}">{$product->name|escape}</h1></div>
					</div>
					<div class="catalog-element-head_right"></div>
				</div>
				<div class="catalog-element-props_and_buy_block clearfix">
					<div class="catalog-element-buy_block">
						<div class="catalog-element-buy_block_bg">
							<div class="catalog-element-buy_block_inner">
								{if $product->variants|count > 0}
									<noindex>
									<form class="js-buyform prod variants2" name="buy_form" action="cart">
										<div class="catalog-element-price">
											{if $product->variant->compare_price > 0}
												<div class="crossed_price"><span class="cros">{$product->variant->compare_price|convert}</span> {$currency->sign|escape}</div>
											{/if}
											<div class="price"><span class="pr">{$product->variant->price|convert}</span> {$currency->sign|escape}</div>
										</div>
										{* Не показывать выбор варианта, если он один и без названия *}
										<select name="variant" {if $product->variants|count==1  && !$product->variant->name}style='display:none;'{/if}>
											{foreach $product->variants as $v}
												<option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"  discount="{($v->compare_price-$v->price)|convert}"{/if} price="{$v->price|convert}">
													{$v->name}
												</option>
											{/foreach}
										</select>
										<div class="catalog-element-buy_buttons">
											<div class="quantity_blk clearfix">
												<span class="quantity_title">Количество:</span>
												<div class="prod_quantity">
													<a class="multimage_icons minus js-basket-minus"></a>
													<input type="text" class="multimage_backs value" name="amount" value="1" data-ratio="1">
													<a class="multimage_icons plus js-basket-plus"></a>
												</div>
												<span class="measure_name">шт </span>
											</div>
											<span id="add2basketblock">
												<button onclick="$(this).closest('form').submit(); basketblock(); return false;"  type="submit" class="add2basket"><i class="icon multimage_icons"></i>В корзину</button>
												<a rel="nofollow" class="buy1click b1c" href="#buy1click" data-name="{$product->name|escape}"><i class="icon multimage_icons"></i>Купить в 1 клик</a>
											</span>
											<span  class="js-buyform js-buyform142 inbasket">
												<a title="Перейти в корзину" id="alreadyinbasketblock" style="display: none;" href="/cart/" class="in_basket"><i class="icon multimage_icons"></i><br>Товар добавлен в корзину</a>
											</span>
										</div>
									</form>
									</noindex>                
								{else}
									<div class="price">Нет в наличии</div>
								{/if}
								<div class="catalog-element-share">
									<script type="text/javascript" src="//yandex.st/share/share.js"charset="utf-8"></script>
									<div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="button" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir"></div> 
								</div>
								<div class="catalog-element-consult">
									<div class="submit" rel="nofollow">
										Консультация +7 (861) 217-59-54
									</div>
								</div>
								<div class="catalog_element_block catalog-element-kredit">
									<a href="/garantiya-samoj-nizkoj-tseny" class="submit catalog_element_link" rel="nofollow">
										<div class="catalog_element_ico">
											<i class="icon multimage_icons"></i>
										</div>
										<div class="catalog_element_text">
											Нашли дешевле? Сделаем скидку!
										</div>
									</a>
								</div>
								<div class="catalog_element_block catalog-element-dostavka">
									<div class="catalog_element_ico">
										<i class="icon multimage_icons"></i>
									</div>
									<div class="catalog_element_text">
										Быстрая и бесплатная доставка
									</div>
								</div>
								<div class="catalog-element-compare">
									<form action="/compare" class="compare">
									{if $compare_informer->items_id[{$product->id}]>0}
										В <a href="/compare/">сравнения</a>
									{else}
										<input id="compare_{$product->id}" name="compare" value="{$product->id}" class="add2compare js_add2compare" style="display:none;" type="checkbox" />
										<label for="compare_{$product->id}" style="cursor: pointer">Добавить к сравнению</label>
									{/if}
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="catalog-element-prevtext">
						<div class="scroll_detail_previevtext">
							<div class="jspContainer " style="width: 347px;">
								<div class="jspPane slimscroll" style="padding: 0px; top: 0px; left: 0px; width: 347px;">
									<div>{$product->annotation}</div>
                                    {if $product->features}
										<div class="product_features">
											<div class="product_features_title">
												Характеристики
											</div>
											<div id="tab_properties" class="tabs-content js_tabs_content{if !$product->body} showed{/if}">
												<div class="catalog-element-gruped_props">
                                                    {foreach $product->features as $f}
														<div class="catalog-element-gruped_props-group">
															<div class="catalog-element-gruped_props-props">
																<div class="catalog-element-gruped_prop nechet clearfix">
																	<b>{$f->name}</b>
																	<span>{$f->value}</span>
																</div>
															</div>
														</div>
                                                    {/foreach}
												</div>
											</div>
										</div>
                                    {/if}
								</div>
							</div>
						</div>
						{*<div class="show_all_features_btn_wrapper">
							<a id="show_all_features_btn" href="javascript:;">Показать все характеристики</a>
						</div>*}
					</div>
				</div>
			</div>
			<div class="catalog-element-bottom clearfix">
				<div class="catalog-element-tabs js_tabs">
					<div class="personal-tabsheader">
						<div class="personal-tabsheader-tablink js_tabs_header">
						{if $product->body}
							<a rel="nofollow" class="incative incative-border select" href="#tab_description">
								<span class="tabbg-center ">Описание</span>
								<span class="img-cart multimage_icons"></span>
							</a>
						{/if}
						{*{if $product->features}
							<a rel="nofollow" class="incative incative-border{if !$product->body} select{/if}" href="#tab_properties">
								<span class="tabbg-center ">Характеристики</span>
								<span class="img-cart multimage_icons"></span>
							</a>
						{/if}*}
							<a rel="nofollow" class="incative incative-border{if !$product->body and !$product->features} select{/if}" href="#tab_reviews">
								<span class="tabbg-center ">Отзывы ({$comments|count})</span>
								<span class="img-cart multimage_icons"></span>
							</a>
						</div>
					</div>
					<div class="personal-tabscontent">
						{if $product->body}
						<div id="tab_description" class="tabs-content js_tabs_content showed">
							<div class="catalog-element-description">{$product->body}</div>
						</div>
						{/if}
						{*{if $product->features}
							<div id="tab_properties" class="tabs-content js_tabs_content{if !$product->body} showed{/if}">
								<div class="catalog-element-gruped_props">
									{foreach $product->features as $f}
										<div class="catalog-element-gruped_props-group">
											<div class="catalog-element-gruped_props-props">
												<div class="catalog-element-gruped_prop nechet clearfix">
													<b>{$f->name}</b>
													<span>{$f->value}</span>
												</div>
											</div>
										</div>
									{/foreach}
								</div>
							</div>
						{/if}*}
						<div id="tab_reviews" class="tabs-content js_tabs_content{if !$product->body and !$product->features} showed{/if}">
							<div class="catalog-element-reviews">
								<div id="fancyboxreviewform" style="display:none;">   
									<div>
											<div class="popup">
												<div class="popup_head back0">Оставить отзыв</div>
												<div class="popup_dashed">
													<div class="popup_body">
														<div class="answer_form">
														<!--Форма отправления комментария-->	
														<form method="post" class="reviews-form clearfix">
															{if $error}
															<div class="message_error">
																{if $error=='captcha'}
																Неверно введена капча
																{elseif $error=='empty_name'}
																Введите имя
																{elseif $error=='empty_comment'}
																Введите комментарий
																{/if}
															</div>
															{/if}
															<div>
																<input type="text" class="textinput40 multimage_backs textinput_author" id="REVIEW_AUTHOR" name="name" value="{$comment_name}" data-format=".+" data-notice="Введите имя" placeholder="Ваше имя">
																<textarea class="textareainput textareainput_comment multimage_backs" id="textareaMsgComment" placeholder="Комментарий:" name="text" data-format=".+" data-notice="Введите комментарий">{$comment_text}</textarea><br><br>
																<div class="captcha">
																	<input class="textinput40 multimage_backs textinput_captcha" type="text"  name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу" placeholder="Символы на картинке">
																	<img class="captcha_image" src="captcha/image.php?{math equation='rand(10,10000)'}" alt="Защита от автоматических сообщений">
																</div><br>
														  </div>
														  <input class="btn2" name="comment" id="submitForEeview" type="submit" value="Отправить" tabindex="2">
													</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="bxdynamic_ajiX1b">
									<div id="forum_topic_list" class="reviews-block-button clearfix"><a class="js_fancy_window btn2" href="#fancyboxreviewform">Оставить отзыв</a></div>
										{if $comments}  
											<div class="reviews-block-container reviews-reviews-block-container">
												<div class="reviews-block-outer">
													<div class="reviews-block-inner">
														{foreach $comments as $comment}
															<a name="comment_{$comment->id}"></a>   
															<table cellspacing="0" border="0" class="reviews-post-table reviews-post-first reviews-post-last reviews-post-{if $comment@iteration%2 == 0}even{else}odd{/if} " id="message21">
																<thead>
																	<tr>
																		<td>
																			<div class="poster">
																				<div class="icon multimage_icons profil_icon"></div>
																				<b class="poster_name">{$comment->name|escape}</b>
																				{if !$comment->approved}ожидает модерации{/if}
																				<span class="poster_rating"></span>
																				<span class="message-post-date">{$comment->date|date}, {$comment->date|time}</span>
																				<div class="clear"></div>
																			</div>
																		</td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>
																			<div class="reviews-text">
																				<div class="message_text_comment"><b>Комментарий:</b>  {$comment->text|escape|nl2br}</div>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
															<br/>
														{/foreach}
													</div>
												</div>
											</div> 
										{else}
										<p><font class="errortext">Тут еще никто ничего не писал, стань первым!</font></p>
									{/if}
								</div>
							</div>
						</div>
					</div>
					<!-- /personal-tabscontent -->
				</div>
				<!-- /catalog-element-tabs-->
			</div>
			<!-- /catalog-element-bottom-->
		</div>
	</div>
	<!-- /catalog.element -->
	<div>
		<div class="clear"></div>
		{* Связанные товары *}
		{if $related_products}
			<div class="subtitle">Так же советуем посмотреть</div>
			{foreach $related_products as $product}
				{include file='product_block.tpl'}
			{/foreach}
		{/if} 
	</div>
</div>
<div class="clear"></div> 
<script>			
				
	function basketblock()

	{

		if ($("#alreadyinbasketblock").css("display")=="block")

		{

			$("#alreadyinbasketblock").css("display", "none");

			$("#add2basketblock").css("display", "block");
                        
        }

		else

		{

			$("#alreadyinbasketblock").css("display", "block");

			$("#add2basketblock").css("display", "none");
                        
        }

	}
	
	
</script> 