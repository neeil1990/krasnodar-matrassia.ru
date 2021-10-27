var RSAL_super_banners_time_interval_id = 0;

function RSAL_ChangeImageToPrev()
{
	var currentIndex = parseInt( $('#superBanners').attr('data-showedindex') );
	var $currentPic = $('#super_banner_'+currentIndex);
	var new_index;
	if(currentIndex>0)
		new_index = (currentIndex-1);
	else
		new_index = $('#superBanners').data('lastindex');
	RSAL_ChangeImageTo(new_index);
}

function RSAL_ChangeImageToNext(){
	var currentIndex = parseInt( $('#superBanners').attr('data-showedindex') );
	var $currentPic = $('#super_banner_'+currentIndex);
	var new_index;
	if(currentIndex < $('#superBanners').data('lastindex'))
		new_index = (currentIndex+1);
	else
		new_index = 0;
	if(currentIndex != new_index){
		RSAL_ChangeImageTo(new_index);
	}
}

function RSAL_ChangeImageTo(index)
{
	if(!$('#superBanners').hasClass('sliding') && !$('#superBannersBtns').hasClass('sliding'))
	{
		$('#superBanners, #superBannersBtns').addClass('sliding');
		var currentIndex = parseInt( $('#superBanners').attr('data-showedindex') ),
			nextIndex = index,
			$nextPic = $('#super_banner_'+nextIndex);
		
		$('.super_banners-pictures-pic').each(function(){
			if($(this).data('index')!=nextIndex)
				$(this).css({"zIndex":"5"});
		});
		$nextPic.css({"zIndex":"10"}).animate({
			opacity	: "show"
		},RSAL_change_delay,function(){
			// Animation complete.
			$('#superBanners').attr('data-showedindex', nextIndex).children('#super_banner_'+currentIndex).css({"display":"none"});
			$('.super_banners_btns-pointer').removeClass('selected');
			$('#superBannersBtns').find('.pointer'+nextIndex).addClass('selected');
			$('#superBanners, #superBannersBtns').removeClass('sliding');
			$('.super_banners_btns-items').children().hide().filter('#super_banners_btns_' + nextIndex).show();
		});
	}
}

$(document).ready(function(){
	if(window.RSAL_time_interval === undefined || parseInt(RSAL_time_interval)<1000)
		RSAL_time_interval = 8000;
	if(window.RSAL_change_delay === undefined || parseInt(RSAL_change_delay)<0)
		RSAL_change_delay = 2000;
	$('#superBannersBtnsPrev').on('click',function(){
		clearInterval(RSAL_super_banners_time_interval_id);
		RSAL_ChangeImageToPrev();
		RSAL_super_banners_time_interval_id = setInterval(function(){
			RSAL_ChangeImageToNext();
		},RSAL_time_interval);
		return false;
	});
	$('#superBannersBtnsNext').on('click',function(){
		clearInterval(RSAL_super_banners_time_interval_id);
		RSAL_ChangeImageToNext();
		RSAL_super_banners_time_interval_id = setInterval(function(){
			RSAL_ChangeImageToNext();
		},RSAL_time_interval);
		return false;
	});
	
	$('.super_banners_btns-pointer').on('click',function(){
		clearInterval(RSAL_super_banners_time_interval_id);
		RSAL_ChangeImageTo( $(this).attr('href') );
		RSAL_super_banners_time_interval_id = setInterval(function(){
			RSAL_ChangeImageToNext();
		},RSAL_time_interval);
		return false;
	});
	
	RSAL_super_banners_time_interval_id = setInterval(function(){
		RSAL_ChangeImageToNext();
	},RSAL_time_interval);
});