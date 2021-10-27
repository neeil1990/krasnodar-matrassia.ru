var elem_w = 249;
var maximum = 0;
var elems_count = 0;
var slider_show_count = 0;
function RSPCompareInitScroller()
{
	var wrap_inner_w = $('.wrap_inner').width();
	var selector = '.catalog_compare-scroller, .catalog_compare-scrollerContainer, .catalog_compare-scrollerInner';
	
	if(wrap_inner_w<1050) //small
	{
		slider_show_count = 2;
		$(selector).css('width','499px');
	} else if(wrap_inner_w<1300) //medium
	{
		slider_show_count = 3;
		$(selector).css('width','748px');
	} else { //large
		slider_show_count = 4;
		$(selector).css('width','1000px');
	}
	
	if(elems_count<=slider_show_count)
	{
		$('.catalog_compare-scroller-prev, .catalog_compare-scroller-next').hide();
	} else {
		$('.catalog_compare-scroller-prev, .catalog_compare-scroller-next').show();
	}
	
	maximum = elem_w*(elems_count-slider_show_count);
	
	$('.catalog_compare-scrollerInner').css('left','0px');
	
	$('.catalog_compare-scrollerContainer').css('height', $('.catalog_compare-table_items').height()+15 );
}

$(document).ready(function(){
	/* slider - items */
	elems_count = $('.catalog_compare-item-simple').length;
	RSPCompareInitScroller();
	$(window).resize(function(){
		RSPCompareInitScroller();
	});
	$('.catalog_compare-scroller-prev').on('click',function(){
		var n = Math.abs( parseInt( $('.catalog_compare-scrollerInner').css('left') ) );
		if(n>0)
		{
			$('.catalog_compare-scrollerInner').animate({
				left: '+=249'
			},500,function() {
				// Animation complete.
			});
		}
		return false;
	});
	$('.catalog_compare-scroller-next').on('click',function(){
		var n = Math.abs( parseInt( $('.catalog_compare-scrollerInner').css('left') ) );
		if(n<maximum)
		{
			$('.catalog_compare-scrollerInner').animate({
				left: '-=249'
			},500,function() {
				// Animation complete.
			});
		}
		return false;
	});
	
	/* lights in items properties */
	var RSPCompare_value = "";
	var RSPCompare_best_class = "best_property";
	var RSPCompare_eachTR;
	var RSPCompare_eachTD;
	var last_int_value = 0;
	var last_best_int_value = 0;
	var current_int_value = 0;
	$('.catalog_compare-table_items tbody tr.property_line').each(function(index1){
		RSPCompare_eachTR = $(this);
		last_int_value = 0;
		RSPCompare_eachTR.children('td.property').each(function(index2){
			RSPCompare_eachTD = $(this);
			current_int_value = RSPCompare_eachTD.data('intvalue');
			if( parseInt( last_int_value ) <= parseInt( current_int_value ) )
			{
				last_best_int_value = current_int_value;
			}
			last_int_value = RSPCompare_eachTD.html();
		});
		if(last_best_int_value>0)
			RSPCompare_eachTR.children('td[data-intvalue="'+last_best_int_value+'"]').addClass( RSPCompare_best_class );
	});
	
	/* tr light */
	$('.property_line').on('mouseenter',function(){
		$(this).css('background-color','#f1f1f1');
	}).on('mouseleave',function(){
		$(this).css('background-color','');
	});
	
	/* fixed arrows */
	$(window).scroll(function(){
		var top = $('.around_catalog_compare-scroller').offset().top;
		var windowpos = $(window).scrollTop();
		if( $(window).scrollTop() >= top )
		{
			$('.catalog_compare-scroller-prev, .catalog_compare-scroller-next').css('position', 'fixed');
		} else {
			$('.catalog_compare-scroller-prev, .catalog_compare-scroller-next').css('position', 'absolute');
		}
	});
	
	/* delete */
	$('.catalog_compare-item-delete-delete_link').on('click',function(){
		$( $(this).attr('href') ).attr('checked', true);
		$('.submit_compare_form').click();
	});
});