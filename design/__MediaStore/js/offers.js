var RSAL_OffersExt_timeout_id = 0;

function RSAL_OffersExt_ChangeHTML($elementObj)
{
	var element_id = $elementObj.data('elementid');
	if( RSAL_OFFERS[element_id] )
	{
		// get all selected values
		var arrFullChosed = new Object();
		$elementObj.find('.div_option.selected').each(function(index1){
			var $optionObj = $(this);
			var code = $optionObj.parents('.div_select').data('code');
			var value = $optionObj.data('value');
			arrFullChosed[code] = value;
		});

		// get offerID (key=ID)
		var finedOfferID = 0;
		var all_prop_true2 = true;
		for(offerID in RSAL_OFFERS[element_id].OFFERS)
		{
			all_prop_true2 = true;
			for(pCode in arrFullChosed)
			{
				if( arrFullChosed[pCode] != RSAL_OFFERS[element_id].OFFERS[offerID].PROPERTIES[pCode] )
				{
					all_prop_true2 = false;
					break;
				}
			}
			if(all_prop_true2)
			{
				finedOfferID = offerID;
				break;
			}
		}

		// set image
		if(RSAL_OFFERS[element_id].OFFERS[finedOfferID].IMAGES[0]){
			if(RSAL_OFFERS[element_id].OFFERS[finedOfferID].IMAGES[0].src.indexOf("redsign_devfunc_nophoto") < 0){
				if($elementObj.hasClass('js-detailpage')){
					$extimages = $elementObj.find('.catalog-element-extimages');
					$extimages.find('.offer_img').removeClass('selected').addClass('hided');
					$extimages.find('.offer'+finedOfferID).removeClass('hided');
					$extimages.find('.around_image:visible:first').addClass('selected').find('.image').trigger('click');
					var imgCnt = parseInt($extimages.find('.around_image:visible').length),
						newWidth = imgCnt * 100;
					$elementObj.find('.catalog-element-extimages_slider_inner').css({'width':newWidth,"left":0});
					if(imgCnt<6)
					{
						$elementObj.find('.catalog-element-extimages_arrow_prev, .catalog-element-extimages_arrow_next').addClass('little');
					} else {
						$elementObj.find('.catalog-element-extimages_arrow_prev').addClass('disabled').removeClass('little');
						$elementObj.find('.catalog-element-extimages_arrow_next').removeClass('disabled little');
					}
				}
				else{ // not detail page
					$elementObj.find('.image')
						.attr('src', RSAL_OFFERS[element_id].OFFERS[finedOfferID].IMAGES[0].src )
						.attr('width', RSAL_OFFERS[element_id].OFFERS[finedOfferID].IMAGES[0].width )
						.attr('height', RSAL_OFFERS[element_id].OFFERS[finedOfferID].IMAGES[0].height );
				}
			}
		}

		// show/hide blocks
		$elementObj.find('.js_swap_hide').hide().parent().find('.js_swap_show_'+finedOfferID).show();
		
		// daysarticle & quickbuy
		$elementObj.removeClass('da').removeClass('qb');
		if($elementObj.find('.timer_da'+finedOfferID).length > 0 && $elementObj.find('.timer_da'+element_id).length < 1){
			$elementObj.addClass('da').find('.timer_da'+finedOfferID).show();
		}
		else if($elementObj.find('.timer_da'+finedOfferID).length < 1 && $elementObj.find('.timer_quickbuy'+finedOfferID).length < 1 && $elementObj.find('.timer_da'+element_id).length > 0){
			$elementObj.addClass('da').find('.timer_da'+element_id).show();
		}
		else if($elementObj.find('.timer_da'+finedOfferID).length < 1 && $elementObj.find('.timer_quickbuy'+finedOfferID).length < 1 && $elementObj.find('.timer_quickbuy'+element_id).length > 0){
			$elementObj.addClass('qb').find('.timer_quickbuy'+element_id).show();
		}
		else if($elementObj.find('.timer_quickbuy'+element_id).length > 0){
			$elementObj.addClass('qb').find('.timer_quickbuy'+element_id).show();
		}
		else if($elementObj.find('.stickers_icons').length > 0){
			$elementObj.find('.stickers_icons').show();
		}
		
		// set price
		if(RSAL_OFFERS[element_id].OFFERS[finedOfferID].MIN_PRICE.DISCOUNT_DIFF > 0){
			if($elementObj.hasClass('qb') || $elementObj.hasClass('da')){
				$elementObj.find('.discount').show().html('- ' + RSAL_OFFERS[element_id].OFFERS[finedOfferID].MIN_PRICE.PRINT_DISCOUNT_DIFF);
			}
			else{
				$elementObj.find('.crossed_price').show().html( RSAL_OFFERS[element_id].OFFERS[finedOfferID].MIN_PRICE.PRINT_VALUE);
			}
		}
		else{
			$elementObj.find('.crossed_price, .discount').hide().html('');
		}
		$elementObj.find('.price').html(RSAL_OFFERS[element_id].OFFERS[finedOfferID].MIN_PRICE.PRINT_DISCOUNT_VALUE);
		
		// set add2basket url & enable/disable
		$elementObj.find('.js-buyproductid').val( finedOfferID );
		if(RSAL_OFFERS[element_id].OFFERS[finedOfferID].CAN_BUY){
			$elementObj.find('.add2basket').removeClass('disabled');
		}
		else{
			$elementObj.find('.add2basket').addClass('disabled');
		}

		// set buttons "in basket" and "not in basket"
		RSAL_SetInBasket();

		// fancybox reposition
		$.fancybox.toggle();
	}
}

function RSAL_OffersExt_PropChanged($optionObj)
{
	var element_id = $optionObj.parents('.js-element').data('elementid');
	var CURRENT_PROP_CODE = $optionObj.parents('.div_select').data('code');
	var value = $optionObj.data('value');
	if( RSAL_OFFERS[element_id] && !$optionObj.hasClass('disabled') )
	{
		// change styles
		$optionObj.parents('.div_select').removeClass('opened').addClass('closed');
		$optionObj.parents('.div_select').find('.div_option').removeClass('selected');
		$optionObj.addClass('selected');
		
		var next_index = 0;
		var NEXT_PROP_CODE = '';
		var PROP_CODE = '';
		
		// get current values
		var arCurrentValues = new Object();
		for(index in RSAL_OFFERS[element_id].SORT_PROPS)
		{
			PROP_CODE = RSAL_OFFERS[element_id].SORT_PROPS[index];
			arCurrentValues[PROP_CODE] = $optionObj.parents('.js-element').find('.prop_'+PROP_CODE).find('.div_option.selected').data('value');
			// save next prop_code
			if(PROP_CODE==CURRENT_PROP_CODE)
			{
				var next_index = parseInt(index)+1;
				if( RSAL_OFFERS[element_id].SORT_PROPS[next_index] )
					NEXT_PROP_CODE = RSAL_OFFERS[element_id].SORT_PROPS[next_index];
				else
					NEXT_PROP_CODE = false;
				break;
			}
		}

		// get enabled values for next property
		if(NEXT_PROP_CODE)
		{
			var allPropTrue1 = true;
			var arNextEnabledProps = new Array();
			for(offerID in RSAL_OFFERS[element_id].OFFERS)
			{
				allPropTrue1 = true;
				for(pCode1 in arCurrentValues)
				{
					if( arCurrentValues[pCode1] != RSAL_OFFERS[element_id].OFFERS[offerID].PROPERTIES[pCode1] )
					{
						allPropTrue1 = false;
					}
				}
				if(allPropTrue1)
				{
					arNextEnabledProps.push( RSAL_OFFERS[element_id].OFFERS[offerID].PROPERTIES[NEXT_PROP_CODE] );
				}
			}

			// disable and enable values for NEXT_PROP_CODE
			$optionObj.parents('.js-element').find('.prop_'+NEXT_PROP_CODE).find('.div_option').each(function(i){
				var $option = $(this);
				var emptyInEnabled = true;
				for(inden in arNextEnabledProps)
				{
					if( $option.data('value') == arNextEnabledProps[inden] )
					{
						emptyInEnabled = false;
						break;
					}
				}
				$option.addClass('disabled');
				if(!emptyInEnabled)
					$option.removeClass('disabled');
			});

			// call itself
			var nextOptionObj;
			if(!$optionObj.parents('.js-element').find('.prop_'+NEXT_PROP_CODE).find('.div_option.selected').hasClass('disabled')){
				nextOptionObj = $optionObj.parents('.js-element').find('.prop_'+NEXT_PROP_CODE).find('.div_option.selected');
			}
			else{
				nextOptionObj = $optionObj.parents('.js-element').find('.prop_'+NEXT_PROP_CODE).find('.div_option:not(.disabled):first');
			}
			RSAL_OffersExt_PropChanged(nextOptionObj);
		}
		else{
			RSAL_OffersExt_ChangeHTML( $optionObj.parents('.js-element') );
		}
	}
}

$(document).ready(function(){
	// prop select -> click
	$(document).on('click','.js_select .div_option',function(e){
		e.stopPropagation();
		clearTimeout( RSAL_OffersExt_timeout_id );
		var $optionObj = $(this);
		if(!$optionObj.hasClass('disabled')){
			var element_id = $optionObj.parents('.js-element').data('elementid');
			var propCode = "";
			var value = "";
			if($optionObj.parents('.div_select').hasClass('closed') && !$optionObj.parents('.div_select').hasClass('fullopen')) // was closed, now need open
			{
				$('.offer_prop .div_select.opened').removeClass('opened').addClass('closed');
				$optionObj.parents('.div_select').removeClass('closed').addClass('opened');
			} else { // was opened, now need close
				propCode = $optionObj.parents('.div_select').data('code');
				value = $optionObj.data('value');
				if( RSAL_OFFERS[element_id] )
				{
					RSAL_OffersExt_PropChanged($optionObj);
				} else {
					if(!$optionObj.parents('.js-element').hasClass('js-detailpage'))
						RSAL_Area2Darken( $optionObj.parents('.js-element').find('.catalog-item_inner') );
					else
						RSAL_Area2Darken( $optionObj.parents('.js-element').find('.catalog-element_inner') );
					RSAL_OffersExt_timeout_id = setTimeout(function(){
						var url = RSAL_SITE_DIR + 'catalog/?ajax_action=get_element_json&element_id=' + element_id;
						$.getJSON(url, {}, function(json){
							RSAL_OFFERS[element_id] = json;
							RSAL_OffersExt_PropChanged($optionObj);
							if(!$optionObj.parents('.js-element').hasClass('js-detailpage'))
								RSAL_Area2Darken( $optionObj.parents('.js-element').find('.catalog-item_inner') );
							else
								RSAL_Area2Darken( $optionObj.parents('.js-element').find('.catalog-element_inner') );
						}).fail(function(data){
							if(!$optionObj.parents('.js-element').hasClass('js-detailpage'))
								RSAL_Area2Darken( $optionObj.parents('.js-element').find('.catalog-item_inner') );
							else
								RSAL_Area2Darken( $optionObj.parents('.js-element').find('.catalog-element_inner') );
						});
					},RSAL_RequestDelay);
				}
			}
		}
		return false;
	});
	// close prop select by click outside
	$(document).on('click',function(e){
		if( $(e.target).parents('.offer_prop').length>0 && !$(e.target).parents('.offer_prop').hasClass('color') )
		{

		} else {
			$('.div_select').removeClass('opened').addClass('closed');
		}
	});

});