/*
* v 1.0.1
* modified 06.05.13
* bugfix
*/

var RSP_Menu_firstWidth = 600;
var RSP_Menu_brandsInMenuWidth = 175;
var RSP_Menu_elementInMenuWidth = 215;

function RSP_CatalogMenuInitStyles()
{
	$('#menu_catalog .lvl1').each(function(){
		if(!$(this).hasClass('li_excess_item'))
		{
			if($(this).find('.lvl2').length>0)
			{
				$(this).find('.lvl2').wrapAll('<div class="submenu_lvl1 none2" />');
				$(this).children('.submenu_lvl1').prepend( $(this).children('.a_lvl1').clone() );
				if($(this).find('.lvl2').length>0)
					$(this).find('.lvl2').wrapAll('<div class="submenu_lvl1_inner" />');
				$(this).find('.submenu_lvl1_inner').append( '<div class="clear"></div>' );
				if($(this).children('.brands_in_menu').length>0)
				{
					$(this).find('.submenu_lvl1_inner').prepend( $(this).children('.brands_in_menu') );
				}
				if($(this).children('.element_in_menu').length>0)
				{
					$(this).find('.submenu_lvl1_inner').prepend( $(this).children('.element_in_menu') );
				}
			} else {
				if($(this).children('.brands_in_menu').length>0)
				{
					$(this).children('.brands_in_menu').remove();
				}
				if($(this).children('.element_in_menu').length>0)
				{
					$(this).children('.element_in_menu').remove();
				}
			}
			$('#menu_catalog').css('overflow','visible');
			$('#menu_catalog').css('height','auto');
			RSP_CatalogMenuSetWindth();
			if($(this).find('.lvl2').length>0)
				$(this).find('.lvl2').wrapAll('<div class="around_lvl2" />');
		}
	});
}

function RSP_CatalogMenuOnResize()
{
	if($('.wrap_inner').width()<1000)
	{
		$('.brands_in_menu').hide();
		$('.element_in_menu').hide();
	} else {
		$('.brands_in_menu').show();
		$('.element_in_menu').show();
	}
	RSP_CatalogMenuSetWindth();
}

function RSP_CatalogMenuSetWindth()
{
	var width = 0;
	var wrap_inner_w = $('.wrap_inner').width();
	$('#menu_catalog .lvl1').each(function(){
		if(!$(this).hasClass('li_excess_item'))
		{
			width = RSP_Menu_firstWidth;
			if($(this).find('.brands_in_menu').length>0 && wrap_inner_w>1000)
			{
				width = width + RSP_Menu_brandsInMenuWidth;
			} else {
				width = width + 0;
			}
			if($(this).find('.element_in_menu').length>0 && wrap_inner_w>1000)
			{
				width = width + RSP_Menu_elementInMenuWidth;
			} else {
				width = width + 0;
			}
			$(this).find('.submenu_lvl1_inner').css("width", width );
		}
	});
}

function RSP_SetElemAndBrandsH()
{
	var sub_menu_h = 0;
	$('#menu_catalog .lvl1').each(function(){
		if(!$(this).hasClass('li_excess_item'))
		{
			sub_menu_h = $(this).find('.submenu_lvl1').height()-38;
			if($(this).find('.brands_in_menu').length>0 && parseInt(sub_menu_h)>0)
			{
				$(this).find('.brands_in_menu').css('height', sub_menu_h );
			}
			if($(this).find('.element_in_menu').length>0 && parseInt(sub_menu_h)>0)
			{
				$(this).find('.element_in_menu').css('height', sub_menu_h );
			}
		}
	});
}

function RSP_ObertkaCheckbMenuExcess()
{
	if(RSP_CheckbMenuExcess())
	{
		$('#menu_catalog .li_excess_item').removeClass('none2');
	} else {
		$('#menu_catalog .li_excess_item').addClass('none2');
	}
}

function RSP_CheckbMenuExcess()
{
	var ideal_offset_top = $('#menu_catalog').offset().top;
	var item_offset_top = 0;
	var children_section_id = "";
	var isset_item_need_close = false;
	$('#menu_catalog .lvl1').each(function(index){
		if(!$(this).hasClass('li_excess_item'))
		{
			item_offset_top = $(this).offset().top;
			children_section_id = $(this).children('.a_lvl1').attr('id');
			if(item_offset_top!=ideal_offset_top)
			{
				isset_item_need_close = true;
				if(!$(this).hasClass('lvl1_hide_this'))
				{
					$(this).addClass('lvl1_hide_this');
					$('.submenu_excess_item_inner').find('.'+children_section_id).show();
				}
			} else {
				if($(this).hasClass('lvl1_hide_this'))
				{
					$(this).removeClass('lvl1_hide_this');
					$('.submenu_excess_item_inner').find('.'+children_section_id).hide();
				}
			}
		}
	});
	return isset_item_need_close;
}

$(document).ready(function(){
	/* init menu */
	RSP_CatalogMenuInitStyles();
	RSP_CatalogMenuOnResize();
	RSP_ObertkaCheckbMenuExcess();
	$(window).resize(function(){
		setTimeout(function(){
			RSP_CatalogMenuOnResize();
			RSP_ObertkaCheckbMenuExcess();
		},5);
	});
	RSP_SetElemAndBrandsH();

	// show sub_menu
	$('#menu_catalog .lvl1').on("mouseenter",function(){
		if($(this).children('.submenu_lvl1').length>0 && $(this).find('.submenu_lvl1_inner').length>0)
		{
			$(this).children('.submenu_lvl1').removeClass('none2');
			$(this).find('.submenu_lvl1_inner').css('left','0px');
			var this_r_pos = $(this).find('.submenu_lvl1_inner').offset().left+$(this).find('.submenu_lvl1_inner').width();
			var menu_r_pos = $('#menu_catalog').offset().left+$('#menu_catalog').width();
			var fixer = this_r_pos-menu_r_pos+2;
			var now_left = parseInt( $(this).find('.submenu_lvl1_inner').css('left') );
			if((this_r_pos-2)>=menu_r_pos)
			{
				$(this).find('.submenu_lvl1_inner').css('left','-='+fixer);
			} else {
				$(this).find('.submenu_lvl1_inner').css('left','0px');
			}
		}
	});
	$('#menu_catalog .lvl1').on('mouseleave',function(){
		$(this).children('.submenu_lvl1').addClass('none2');
	});
	
	// show excess sub_menu
	$('.li_excess_item').on('mouseenter',function(){
		$('.submenu_lvl1_excess').removeClass('none2');
	}).on('mouseleave',function(){
		$('.submenu_lvl1_excess').addClass('none2');
	});
});