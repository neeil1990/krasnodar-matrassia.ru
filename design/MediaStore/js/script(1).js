// fancy callbacks
function RSAL_FancyCloseAfterRequest(delay)
{
	if(delay<1)
		delay = RSAL_FancyCloseDelay;
	setTimeout(function(){
		$.fancybox.close();
	},delay);
}
function RSAL_HandlerFancyOnBeforeShow()
{
	if($('.fancybox-inner').find('.errortext').length>0)
		$('.fancybox-inner').find('.errortext').hide();
	if($('.fancybox-inner').find('.notetext').length>0)
		$('.fancybox-inner').find('.notetext').hide();
	if($('.fancybox-inner').find('.reviews-note-error').length>0)
		$('.fancybox-inner').find('.reviews-note-error').hide();
}
function RSAL_HandlerFancyOnAfterClose()
{
	if(RSAL_FancyReloadPageAfterClose)
	{
		window.location.reload();
	}
}
// /fancy callbacks

// Area2Darken
function RSAL_ShowHideModueLoadingIcon()
{
	if($('#mouse_loading_icon').css('display')=="block")
	{
		$('#mouse_loading_icon').css('display','none');
	} else {
		$('#mouse_loading_icon').css('display','block');
	}
}

// Area2Darken
function RSAL_Area2Darken(areaObj)
{
	if(!areaObj.hasClass('areadarken'))
	{
		areaObj.addClass('areadarken').css({"position":"relative"}).append('<div class="area_darken"></div>');
	} else {
		areaObj.removeClass('areadarken').removeAttr('style').find('.area_darken').remove();
	}
}

// slider
function RSAL_SliderClickPrev($btn)
{
	if(!$btn.parents('.main_slider').hasClass('sliding'))
	{
		$btn.parents('.main_slider').addClass('sliding');
		var delay = 400;
		var itemW = parseInt( $btn.parents('.main_slider').data('itemw') );
		var slideOn = parseInt( $btn.parents('.main_slider').data('slideon') );
		slideOn = (slideOn>0 ? slideOn : 1);
		var showInTime = parseInt( $btn.parents('.main_slider').data('showintime') );
		var $slider = $btn.parents('.main_slider').find('.main_slider-slider_inner');
		var elementsCount = parseInt($slider.css('width'))/itemW;
		var hidedLeftCount = Math.abs( parseInt($slider.css('left'))/itemW );
		var hidedRightCount = elementsCount - showInTime - hidedLeftCount;
		if(hidedLeftCount<slideOn)
			slideOn = hidedLeftCount;
		$slider.animate({left:"+="+(itemW*slideOn)},delay);
		hidedLeftCount = Math.abs( parseInt($slider.css('left'))/itemW );
		hidedRightCount = elementsCount - showInTime - hidedLeftCount;
		if(hidedRightCount==0)
			$btn.parents('.main_slider').find('.main_slider-arrow_next').removeClass('disabled');
		if(hidedLeftCount==0 || hidedLeftCount==slideOn)
			$btn.addClass('disabled');
		setTimeout(function(){
			$btn.parents('.main_slider').removeClass('sliding');
		},400);
	}
}
function RSAL_SliderClickNext($btn)
{
	if(!$btn.parents('.main_slider').hasClass('sliding'))
	{
		$btn.parents('.main_slider').addClass('sliding');
		var delay = 400;
		var itemW = parseInt( $btn.parents('.main_slider').data('itemw') );
		var slideOn = parseInt( $btn.parents('.main_slider').data('slideon') );
		slideOn = (slideOn>0 ? slideOn : 1);
		var showInTime = parseInt( $btn.parents('.main_slider').data('showintime') );
		var $slider = $btn.parents('.main_slider').find('.main_slider-slider_inner');
		var elementsCount = parseInt($slider.css('width'))/itemW;
		var hidedLeftCount = Math.abs( parseInt($slider.css('left'))/itemW );
		var hidedRightCount = elementsCount - showInTime - hidedLeftCount;
		if(hidedRightCount<slideOn)
			slideOn = hidedRightCount;
		$slider.animate({left:"-="+(itemW*slideOn)},delay);
		hidedLeftCount = Math.abs( parseInt($slider.css('left'))/itemW );
		hidedRightCount = elementsCount - showInTime - hidedLeftCount;
		if(hidedLeftCount==0)
			$btn.parents('.main_slider').find('.main_slider-arrow_prev').removeClass('disabled');
		if(hidedRightCount==0 || hidedRightCount==slideOn)
			$btn.addClass('disabled');
		setTimeout(function(){
			$btn.parents('.main_slider').removeClass('sliding');
		},400);
	}
}
// /slider

// set liked
function RSAL_SetLiked()
{
	for(element_id in RSAL_LIKES)
	{
		if(RSAL_LIKES[element_id]==element_id && $('.js-element-id'+element_id).find('.js_likes_link').length>0)
			$('.js-element-id'+element_id).find('.js_likes_link').addClass('liked');
	}
}

// set compared
function RSAL_SetCompared()
{
	for(element_id in RSAL_COMPARE)
	{
		if(RSAL_COMPARE[element_id]=="Y" && $('.js-element-id'+element_id).find('.js_add2compare').length>0)
			$('.js-element-id'+element_id).find('.js_add2compare').addClass('compared');
	}
}

// set in basket
function RSAL_SetInBasket()
{
	$('.js-buyform').removeClass('inbasket');
	for(element_id in RSAL_INBASKET)
	{
		if(RSAL_INBASKET[element_id]=="Y" && $(".js-buyproductid[value='"+element_id+"']").length>0)
		{
			$('.js-buyproductid[value="'+element_id+'"]').parents('.js-buyform').addClass('inbasket');
		}
	}
}

$(document).ready(function(){
	// fancybox windows
	$('.js_fancy_window').fancybox({
		openEffect	: 'fade',
		closeEffect	: 'fade',
		maxWidth	: 800,
		maxHeight	: 800,
		autoSize	: true,
		closeClick	: false,
		title		: null,
		padding		: 0,
		beforeShow	:function(){RSAL_HandlerFancyOnBeforeShow();},
		afterClose	:function(){RSAL_HandlerFancyOnAfterClose();}
	});
	// /fancybox windows
	
	// Click protection
	$(document).on('click','.click_protection',function(e){
		e.stopImmediatePropagation();
		console.warn( 'Click protection' );
		//alert( BX.message("RSAL_JS_TO_MACH_CLICK_LIKES") );
		return false;
	});
	// /Click protection
	
	// likes
	$(document).on('click','.js_likes_link',function(e){
		var $linkObj = $(this);
		$linkObj.addClass('click_protection');
		var element_id = $linkObj.parents('.js-element').data('elementid');
		var url = RSAL_SITE_DIR + 'ajax/ajax.php?action=likes&element_id=' + element_id;
		if(element_id>0)
		{
			$.getJSON(url, {}, function(json){
				if(json.TYPE=="OK")
				{
					if(json.MESSAGE=="added")
					{
						RSAL_LIKES[element_id] = element_id;
						$('.js-element-id'+element_id).find('.js_likes_link').addClass('liked').find('.likes_count').html( json.COUNT );
					} else {
						delete RSAL_LIKES[element_id];
						$('.js-element-id'+element_id).find('.js_likes_link').removeClass('liked').find('.likes_count').html( json.COUNT );
					}
				} else {
					console.warn( json.MESSAGE );
				}
				setTimeout(function(){
					$linkObj.removeClass('click_protection');
				},RSAL_ClickProtectionDelay);
			}).fail(function(){
				console.warn( 'can\'t load json likes' );
				setTimeout(function(){
					$linkObj.removeClass('click_protection');
				},RSAL_ClickProtectionDelay);
			});
		} else {
			console.warn( 'empty param element_id' );
			setTimeout(function(){
				$linkObj.removeClass('click_protection');
			},RSAL_ClickProtectionDelay);
		}
		return false;
	});
	// /likes
	
	// a -> submit form
	$(document).on('click','form a.submit',function(){
		$(this).parents('form').find('input[type="submit"]').trigger('click');
		return false;
	});
	// /a -> submit form
	
	// ajax links in fancy
	$(document).on('click','.js_ajax_link',function(){
		console.log( 'ajax links in fancy' );
		var href = $(this).attr('href');
		var parentselector = $(this).data('parentselector');
		if(href!="" && $(parentselector).length>0 && $(parentselector).parents('.fancybox-inner').length>0)
		{
			$.ajax({
				type	: "GET",
				url		: href,
				data	: "js_ajax_call=Y"
			}).done(function( msg ){
				$(parentselector).html( msg );
				$.fancybox.reposition();
			});
		} else if(href!="")
		{
			$.ajax({
				type	: "GET",
				url		: href,
				data	: "js_ajax_call=Y"
			}).done(function( msg ){
				$('.fancybox-inner').html( msg );
				$.fancybox.reposition();
			});
		} else {
			console.warn( 'can\'t load ajax link' );
		}
		return false;
	});
	// /ajax links in fancy
	
	
	// slider
	$(document).on('click','.main_slider-arrow_prev',function(){
		if(!$(this).hasClass('disabled'))
		{
			RSAL_SliderClickPrev( $(this) );
		}
		return false;
	});
	$(document).on('click','.main_slider-arrow_next',function(){
		if(!$(this).hasClass('disabled'))
		{
			RSAL_SliderClickNext( $(this) );
		}
		return false;
	});
	// /slider
	
	// tabs
	$(document).on('click','.js_tabs_header a',function(){
		$(this).parents('.js_tabs_header').find('a').removeClass('select');
		$(this).addClass('select')
			.parents('.js_tabs').find('.js_tabs_content').removeClass('showed')
			.parents('.js_tabs').find( $(this).attr('href') ).addClass('showed');
		return false;
	});
	// /tabs
	
	// AJAXPAGES
	$(document).on('click','.ajaxpages a',function(){
		var $linkObj = $(this);
		var ajaxurl = $linkObj.data('ajaxurl');
		var ajaxpagesid = $linkObj.data('ajaxpagesid');
		var navpagenomer = $linkObj.data('navpagenomer');
		var navpagecount = $linkObj.data('navpagecount');
		var navnum = $linkObj.data('navnum');
		
		var nextpagenomer = parseInt(navpagenomer) + 1;
		var url = "";
		
		if( $('#'+ajaxpagesid).length>0 && navpagenomer<navpagecount && parseInt(navnum)>0 && ajaxurl!="" )
		{
			RSAL_Area2Darken( $('#'+ajaxpagesid) );
			RSAL_Area2Darken( $linkObj );
			RSAL_ShowHideModueLoadingIcon();
			
			if(ajaxurl.indexOf("?")<1)
			{
				url = ajaxurl + '?ajaxpages=Y&ajaxpagesid=' + ajaxpagesid + '&PAGEN_'+navnum+'='+nextpagenomer;
			} else {
				url = ajaxurl + '&ajaxpages=Y&ajaxpagesid=' + ajaxpagesid + '&PAGEN_'+navnum+'='+nextpagenomer;
			}
			$.ajax({
				url: url
			}).done(function(data){
				$('#'+ajaxpagesid).append( data );
				$linkObj.parents('.ajaxpages').remove();
				RSAL_Area2Darken( $('#'+ajaxpagesid) );
				RSAL_Area2Darken( $linkObj );
				RSAL_ShowHideModueLoadingIcon();
			});
		} else {
			if( !($('#'+ajaxpagesid).length>0) )
			{
				console.warn( 'ajaxpages -> empty DOM element' );
			}
			if( !(navpagenomer<navpagecount) )
			{
				console.warn( 'ajaxpages -> navpagenomer !< navpagecount' );
			}
			if( !(parseInt(navnum)>0) )
			{
				console.warn( 'ajaxpages -> parseInt(navnum)!>0' );
			}
			if( !(ajaxurl!="") )
			{
				console.warn( 'ajaxpages -> ajaxurl is empty' );
			}
		}
		return false;
	});
	// /AJAXPAGES
	
	// AJAX -> delete products from main page tabs
	$(document).on('click','.js_product_delete',function(){
		var $linkObj = $(this);
		$linkObj.addClass('click_protection');
		var element_id = $linkObj.parents('.js-element').data('elementid');
		var from = $linkObj.data('from');
		var url = RSAL_SITE_DIR + 'ajax/ajax.php?action=delete&element_id=' + element_id + '&delete_from=' + from;
		if(element_id>0 && from!="" && from)
		{
			$.getJSON(url, {}, function(json){
				if(json.TYPE=="OK")
				{
					$linkObj.parents('.js-element').remove();
				} else {
					console.warn( json.MESSAGE );
				}
				setTimeout(function(){
					$linkObj.removeClass('click_protection');
				},RSAL_ClickProtectionDelay);
			}).fail(function(){
				console.warn( 'can\'t load json delete' );
				setTimeout(function(){
					$linkObj.removeClass('click_protection');
				},RSAL_ClickProtectionDelay);
			});
		} else {
			console.warn( 'empty param element_id or from' );
			setTimeout(function(){
				$linkObj.removeClass('click_protection');
			},RSAL_ClickProtectionDelay);
		}
		return false;
	});
	// /AJAX -> delete products from main page tabs
	
	// add phone_tables class for BODY
	if(RSAL_PHONETABLET=="Y"){
		$('body').addClass('phone_tablet');
		$('.remove_for_tablet').remove();
	}
	else{
		if(RSAL_SHOW_MOUSE_LOADING=="Y"){
			$(document).on('mousemove',function(e){
				$('#mouse_loading_icon').css({"top":(e.pageY+20),"left":(e.pageX+15)});
			});
		}
	}
	$(document).on('mouseenter','.js-basket-minus, .js-basket-plus',function(){
		$('html').addClass("disableSelection");
	}).on('mouseleave','.js-basket-minus, .js-basket-plus',function(){
		$('html').removeClass("disableSelection");
	}).on('click','.js-basket-plus',function(){
	    var id = $(this).parents('.js-element').data('elementid'),
			value = $(this).siblings('input'),
			ratio = value.data('ratio'),
			real = ratio.toString().split('.', 2)[1],
			length = 0;
		if(real !== undefined){
			length = real.length;
		}
		$('.js-element-id'+ id).find('.prod_quantity input').val((parseFloat(value.val()) + ratio).toFixed(length));
	}).on('click','.js-basket-minus',function(){
		var id = $(this).parents('.js-element').data('elementid'),
			value = $(this).siblings('input'),
			ratio = value.data('ratio'),
			real = ratio.toString().split('.', 2)[1],
			length = 0;
		if(real !== undefined){
			length = real.length;
		}
		if(value.val() > ratio){
			$('.js-element-id'+ id).find('.prod_quantity input').val((parseFloat(value.val()) - ratio).toFixed(length));
		}
	});

	$(document).on('mouseenter','.js-basket-minus1, .js-basket-plus1',function(){
		$('html').addClass("disableSelection");
	}).on('mouseleave','.js-basket-minus1, .js-basket-plus1',function(){
		$('html').removeClass("disableSelection");
	}).on('click','.js-basket-plus1',function(){
	    var id = $(this).parents('.js-element').data('elementid'),
			value = $(this).siblings('input'),
			ratio = value.data('ratio'),
			real = ratio.toString().split('.', 2)[1],
			length = 0;
		if(real !== undefined){
			length = real.length;
		}
		$('.js-element-id'+ id).find('.prod_quantity input').val((parseFloat(value.val()) + ratio).toFixed(length));
    document.cart.submit();
	}).on('click','.js-basket-minus1',function(){
		var id = $(this).parents('.js-element').data('elementid'),
			value = $(this).siblings('input'),
			ratio = value.data('ratio'),
			real = ratio.toString().split('.', 2)[1],
			length = 0;
		if(real !== undefined){
			length = real.length;
		}
		if(value.val() > ratio){
			$('.js-element-id'+ id).find('.prod_quantity input').val((parseFloat(value.val()) - ratio).toFixed(length));
		}
    document.cart.submit();
	});
});
function RSAL_SetDeviceType(){
	if(RSAL_PHONETABLET == 'Y'){
		$('.body').addclass('tab');
	}
}
$(document).ready(function(){	
	/* refresher */
	$(document).on('click','.refresher',function(){
		$(this).parents('form').find('.refresher_delay_delete').click();
		return false;
	});
	// disable selection when we over +/-
	$(document).on('click','.nextorder',function(){
		$('#over_fon2').hide();
		$('#over_fon').show();
		$(this).hide();
		$("body,html").animate({"scrollTop":0},900);
		$('.prevbasket').show();
		return false;
	});
});
