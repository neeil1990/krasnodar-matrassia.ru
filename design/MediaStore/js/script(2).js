$(document).ready(function(){
	// show menu
	var $top_panel = $('#top_panel');
	$top_panel.find('.js-personal_menu').on('mouseenter',function(){
		$(this).find('.js-personal_submenu').animate({
			opacity:"show"
		},150,function(){
			// Animation complete.
		});
	});
	$top_panel.find('.js-personal_submenu').on('mouseleave',function(){
		$(this).animate({
			opacity:"hide"
		},250);
	});
});