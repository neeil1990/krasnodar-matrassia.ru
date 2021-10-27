// Аяксовая корзина
$('form.variants').live('submit', function(e) {
	e.preventDefault();
	button = $(this).find('input[type="submit"]');
	if($(this).find('input[name=variant]:checked').size()>0)
		variant = $(this).find('input[name=variant]:checked').val();
	if($(this).find('select[name=variant]').size()>0)
		variant = $(this).find('select').val();
	$.ajax({
		url: "ajax/cart.php",
		data: {variant: variant,amount: $(this).find('input[name="amount"]').val()},
		dataType: 'json',
		success: function(data){
			$('#cart_informer').html(data);
			if(button.attr('data-result-text'))
				button.val(button.attr('data-result-text'));
		}
	});
	var o1 = $(this).offset();
	var o2 = $('#cart_informer').offset();
	var dx = o1.left - o2.left;
	var dy = o1.top - o2.top;
	var distance = Math.sqrt(dx * dx + dy * dy);
	$(this).closest('.catalog-item').find('.catalog-item-picture img').effect("transfer", { to: $("#cart_informer"), className: "transfer_class" }, distance);	
	$('.transfer_class').html($(this).closest('.catalog-item').find('.catalog-item-picture').html());
	$('.transfer_class').find('img').css('height', '100%');
	return false;
});

// Аяксовая корзина
$('form.variants2').live('submit', function(e) {
	e.preventDefault();
	button = $(this).find('input[type="submit"]');
	if($(this).find('input[name=variant]:checked').size()>0)
		variant = $(this).find('input[name=variant]:checked').val();
	if($(this).find('select[name=variant]').size()>0)
		variant = $(this).find('select').val();
	$.ajax({
		url: "ajax/cart.php",
		data: {variant: variant,amount: $(this).find('input[name="amount"]').val()},
		dataType: 'json',
		success: function(data){
			$('#cart_informer').html(data);
			if(button.attr('data-result-text'))
				button.val(button.attr('data-result-text'));
		}
	});
	var o1 = $(this).offset();
	var o2 = $('#cart_informer').offset();
	var dx = o1.left - o2.left;
	var dy = o1.top - o2.top;
	var distance = Math.sqrt(dx * dx + dy * dy);
	$(this).closest('.catalog-element').find('.catalog-element-mainimage img').effect("transfer", { to: $("#cart_informer"), className: "transfer_class" }, distance);	
	$('.transfer_class').html($(this).closest('.catalog-element').find('.catalog-element-mainimage').html());
	$('.transfer_class').find('img').css('height', '100%');
	return false;
});

$(document).ready(function() {
               
	// Выбор вариантов
	$('select[name=variant]').change(function() {
		price = $(this).find('option:selected').attr('price');
		compare_price = '';
		if(typeof $(this).find('option:selected').attr('compare_price') == 'string')
			compare_price = $(this).find('option:selected').attr('compare_price');
    if(typeof $(this).find('option:selected').attr('discount') == 'string')
			discount = $(this).find('option:selected').attr('discount');  
		$(this).closest('.prod').find('span.pr').html(price);
		$(this).closest('.prod').find('span.disc').html(discount);
    $(this).closest('.prod').find('span.cros').html(compare_price);
		return false;		
	});
	
});

$(document).ready(function(){	

	// Капча
	$('.captcha img').attr('src', 'captcha/image.php');

	// disable selection when we over +/-
	$(document).on('click','.nextorder',function(){
		$('#over_fon').hide();
		$('#over_fon2').show();
		$(this).hide();
		$("body,html").animate({"scrollTop":0},900);
		$('#go_basket2').show();
    $('.prevorder').show();
		return false;
	});
  	$(document).on('click','.prevorder',function(){
		$('#over_fon2').hide();
		$('#over_fon').show();
		$(this).hide();
    $('.prevorder').hide();
		$("body,html").animate({"scrollTop":0},900);
		$('#go_basket').show();
    $('.nextorder').show();
		return false;
	});
});
