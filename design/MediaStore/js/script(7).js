var compare_settings,
	compare_pane,
	compare_api;

function RSAL_RefreshCompareListPopup()
{
	compare_settings = {};
	compare_pane = $('#scroll_comparelist');
	compare_pane.jScrollPane(compare_settings);
	compare_api = compare_pane.data('jsp');
}

// Add2Compare
function RSAL_Add2Compare(id,$linkObj)
{
	if(parseInt(id) > 0){
		$linkObj.addClass('click_protection');
		RSAL_Area2Darken($('#popupcomparelist').find('.catalog_compare_list'));
		RSAL_Area2Darken($('.js_add2compare'));
		RSAL_ShowHideModueLoadingIcon();
		var url = RSAL_SITE_DIR + 'catalog/?action=ADD_TO_COMPARE_LIST&id=' + id + '&ajax_action=add2compare';
		$.ajax({
			url: url
		}).done(function(data){
			RSAL_COMPARE[id] = "Y";
			$('.js-element-id'+id).find('.js_add2compare').addClass('compared');
			$('#popupcomparelist').html( data );
			RSAL_Area2Darken($('.js_add2compare'));
			RSAL_ShowHideModueLoadingIcon();
			RSAL_RefreshCompareListPopup();
			setTimeout(function(){
				$linkObj.removeClass('click_protection');
			}, RSAL_ClickProtectionDelay);
		}).fail(function(){
			console.warn( 'fail add2compare' );
			setTimeout(function(){
				$linkObj.removeClass('click_protection');
			}, RSAL_ClickProtectionDelay);
		});
	}
}

// delete from compare
function RSAL_DeleteFromCompare(id,$linkObj)
{
	if(parseInt(id) > 0){
		if($linkObj){
			$linkObj.addClass('click_protection');
		}
		RSAL_Area2Darken($('#popupcomparelist').find('.catalog_compare_list'));
		RSAL_Area2Darken($('.js_add2compare'));
		RSAL_ShowHideModueLoadingIcon();
		var url = RSAL_SITE_DIR + 'catalog/?action=DELETE_FROM_COMPARE_LIST&id=' + id + '&ajax_action=add2compare';
		$.ajax({
			url: url
		}).done(function(data){
			delete RSAL_COMPARE[id];
			$('.js-element-id'+id).find('.js_add2compare').removeClass('compared');
			$('#popupcomparelist').html(data);
			RSAL_Area2Darken($('.js_add2compare'));
			RSAL_ShowHideModueLoadingIcon();
			RSAL_RefreshCompareListPopup();
			setTimeout(function(){
				if($linkObj){
					$linkObj.removeClass('click_protection');
				}
			}, RSAL_ClickProtectionDelay);
		}).fail(function(){
			console.warn('fail delete from compare');
			setTimeout(function(){
				if($linkObj){
					$linkObj.removeClass('click_protection');
				}
			}, RSAL_ClickProtectionDelay);
		});
	}
}

$(document).ready(function(){
	RSAL_RefreshCompareListPopup();
	
	// AJAX -> add2compare 
	$(document).on('click','.js_add2compare',function(){
		var $linkObj = $(this);
		var id = $linkObj.parents('.js-element').data('elementid');
		if($linkObj.hasClass('compared'))
		{
			RSAL_DeleteFromCompare(id,$linkObj);
		} else {
			RSAL_Add2Compare(id,$linkObj);
		}
		return false;
	});
	
	// AJAX -> delete from compare
	$(document).on('click','#popupcomparelist .catalog_compare_list-item',function(){
		var id = $(this).find('.compare_element_id').val();
		RSAL_DeleteFromCompare(id);
		return false;
	});
	
	// go2compare table
	$(document).on('click','#popupcomparelist .catalog_compare_submit',function(){
		$(this).parents('#popupcomparelist').find('.go2compareresult').click();
		return false;
	});
});

BX.addCustomEvent('onFrameDataReceived', RSAL_RefreshCompareListPopup);
BX.addCustomEvent('onFrameDataReceived', RSAL_SetCompared);