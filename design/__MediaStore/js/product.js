var detail_previevtext_settings;
var detail_previevtext_pane;
var detail_previevtext_api;

function RSAL_RefresDetailjJScollPane(){
	// jScrollPane
	detail_previevtext_settings = {};
	detail_previevtext_pane = $('.scroll_detail_previevtext');
	detail_previevtext_pane.jScrollPane(detail_previevtext_settings);
	detail_previevtext_api = detail_previevtext_pane.data('jsp');
	// /jScrollPane
}

function RSAL_SliderMoveSelec($link){//deprecated
	var index = $link.attr('href');
	var newLeftPos = 3 + 100*index;
	$link.parents('.js-element').find( ".selected_block" ).animate({left:newLeftPos},400);
}

$(document).ready(function(){
	// jScrollPane
	RSAL_RefresDetailjJScollPane();
	// /jScrollPane
	
	// switch ext images
	$(document).on('click','.catalog-element-extimages_slider .image',function(){
		$extimages = $(this).parents('.catalog-element-extimages_slider');
		$extimages.find('.around_image.selected').removeClass('selected');
		$(this).parents('.around_image').addClass('selected').parents('.js-element').find('.image_for_watch').attr('src', $(this).data('bigimagesrc'));
		$extimages.find( ".selected_block" ).animate({left: 3 + 100 * $extimages.find('.around_image.selected').index('.around_image:visible')}, 400);
		return false;
	});
	
	// quantity and store
	$(document).on('mouseenter','.catalog-element-quantity .quantity_empty .status, .catalog-element-quantity .quantity_isset .status',function(){
		var $obj = $(this);
		$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').show().animate({
			opacity:1,
			bottom:'22'
		}, 100, function() {
			// Animation complete.
		});
	}).on('mouseleave','.catalog-element-quantity .quantity_empty .status, .catalog-element-quantity .quantity_isset .status',function(){
		var $obj = $(this);
		$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').animate({
			opacity:0,
			bottom:'100'
		}, 250, function() {
			$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').hide();
			// Animation complete.
		});
	}).on('click','.catalog-element-quantity .quantity_empty .status, .catalog-element-quantity .quantity_isset .status',function(){
		var $obj = $(this);
		if($obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').css('display')=="none")
		{
			$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').css({"opacity":"0","bottom":"100px"}).show().animate({
				opacity:1,
				bottom:'22'
			}, 100, function() {
				// Animation complete.
			});
		} else {
			$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').addClass('shadow');
			setTimeout(function(){
				$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').removeClass('shadow');
			},200);
		}
		return false;
	});
	$(document).on('click','.catalog-element-quantity-popup',function(){
		var $popup = $(this);
		$popup.animate({
			opacity:0,
			bottom:'100'
		}, 250, function() {
			$popup.hide();
			// Animation complete.
		});
		return false;
	});
	
	// size table
	$(document).on('click','.offer_prop.size .size_table a',function(){
		var $obj = $(this);
		if(!$obj.parents('.size_table').find('.catalog-element-size_table-popup').is(':visible'))
		{
			$obj.parents('.size_table').find('.catalog-element-size_table-popup').show().animate({
				opacity:1,
				bottom:'22'
			}, 100, function() {
				// Animation complete.
			});
		} else {
			$obj.parents('.size_table').find('.catalog-element-size_table-popup').addClass('shadow');
			setTimeout(function(){
				$obj.parents('.size_table').find('.catalog-element-size_table-popup').removeClass('shadow');
			},200);
		}
		return false;
	});
	$(document).on('click','.catalog-element-size_table-popup',function(){
		var $popup = $(this);
		$popup.animate({
			opacity:0,
			bottom:'100'
		}, 250, function(){
			$popup.hide();
			// Animation complete.
		});
		return false;
	});
	$(document).on('click',function(){
		var $obj = $(this);
		if($('.catalog-element-size_table-popup').is(':visible'))
		{
			$('.catalog-element-size_table-popup').show().animate({
				opacity:0,
				bottom:'100'
			}, 100, function() {
				$('.catalog-element-size_table-popup').hide();
				// Animation complete.
			});
		}
	});
	
	// buy1click
	$(document).on('click','.js-buy1click',function(){
		var sValue = '',
			$catalog_element = $(this).parents('.catalog-element'),
			product_url = $catalog_element.hasClass('is_popup') ? window.location.protocol+'//'+window.location.host+$catalog_element.find('.go2detail_from_popup').attr('href') : window.location.href;
		sValue = sValue + RSAL_Buy1click_SetData($catalog_element.data('elementid'), $(this).data('name'), product_url);
		$('#buy1click').find('textarea.order_list').text(sValue);
	});
});