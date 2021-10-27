$(document).ready(function(){
	$('#title-search-input').on('focus', function(){
		$(this).parents('#title-search').addClass('focused');
	}).on('blur', function(){
		$(this).parents('#title-search').removeClass('focused');
	}); 
});
$(document).ready(function(){
	$('.section_list .lvl1').on('mouseenter',function(){
		$(this).find('.lvl1_submenu').removeClass('none2')
	}).on('mouseleave',function(){
		$(this).find('.lvl1_submenu').addClass('none2')
	});

	// toggle properties
	$('.showchild').on('click',function(){
		var propID = $(this).data('propid'),
			subUlID = $($(this).attr('href')),
			statusOLD = subUlID.css('display');
		if(statusOLD == 'block'){
			$(this).find('.icon').addClass('icon-plus').removeClass('icon-minus');
		}
		else{
			$(this).find('.icon').addClass('icon-minus').removeClass('icon-plus');
		}
		subUlID.slideToggle('fast');
		if(subUlID.children('.scroll_brands').length > 0){
			var $jspContainer = subUlID.find('.jspContainer'),
				$jspPane = subUlID.find('.jspPane');
			if($jspContainer.height() < $jspPane.height()){
				f_brands_api.reinitialise();
			}
		}

		return false;
	});
  
  
  });
  
 $(document).ready(function(){

	// catalog element -> hover //
	$(document).on('mouseenter','.catalog-item',function(){//,document
		$('.catalog-item').removeClass('hovered');
		$(this).addClass('hovered');
	}).on('mouseleave','.catalog-item',function(){//,'.catalog-item'
		$(this).removeClass('hovered');
		$(this).find('.div_select.opened').removeClass('opened').addClass('closed');
	});
  

  
  
  
}); 
  
  
 