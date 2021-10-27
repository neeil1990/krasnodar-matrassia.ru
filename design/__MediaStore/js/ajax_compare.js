// Добавление товара к сравнению



$('input[name=compare]:checked').live('click', function(e) {

      var val = $(this).val()
      var bl =  $(this).closest('.compare');

      $.ajax({
    		url: "ajax/compare.php",
    		data: {compare: val},
	     	dataType: 'json',
    		success: function(data){
            if(data){
    			$('#compare_informer').html(data);
    			bl.html("<a href=\"/compare/\"> В сравнение</a>");
            }
    		}
    	});

    	

});

