function RSAL_CataloMenuSetLeftPos(menuObj)
{
	if(!menuObj.hasClass('js_posChecked'))
	{
		var resultat = $('#menu_catalog').outerWidth() + $('#menu_catalog').offset().left - menuObj.outerWidth() - menuObj.offset().left;
		if(resultat<0)
		{
			menuObj.find('.submenu_lvl1_inner').css('left',resultat);
		}
		menuObj.addClass('js_posChecked');
	}
}

$(document).ready(function(){
	$('#menu_catalog').find('.lvl1').on('mouseenter',function(){
		if($(this).find('.submenu_lvl1').length>0)
		{
			$(this).find('.submenu_lvl1').removeClass('none2');
			RSAL_CataloMenuSetLeftPos($(this).find('.submenu_lvl1'));
		}
	}).on('mouseleave',function(){
		if($(this).find('.submenu_lvl1').length>0)
		{
			$(this).find('.submenu_lvl1').addClass('none2');
		}
	});
});