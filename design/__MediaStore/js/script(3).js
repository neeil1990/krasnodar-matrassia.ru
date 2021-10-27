$(document).ready(function(){
	// add class on mouseenter
	$('#header').find('.js_basket_top_panel').on('mouseenter',function(){
		$(this).toggleClass('basket_top_panel_hovered');
	}).on('mouseleave',function(){
		$(this).toggleClass('basket_top_panel_hovered');
	});
});
