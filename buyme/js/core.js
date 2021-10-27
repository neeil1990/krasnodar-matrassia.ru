/**
* $.Storage: author Dave Schindler
* Distributed under the MIT License
* Copyright 2010
**/
 
(function($) {
var isLS=typeof window.localStorage!=='undefined';
function wls(n,v){var c;if(typeof n==="string"&&typeof v==="string"){localStorage[n]=v;return true;}else if(typeof n==="object"&&typeof v==="undefined"){for(c in n){if(n.hasOwnProperty(c)){localStorage[c]=n[c];}}return true;}return false;}
function wc(n,v){var dt,e,c;dt=new Date();dt.setTime(dt.getTime()+31536000000);e="; expires="+dt.toGMTString();if(typeof n==="string"&&typeof v==="string"){document.cookie=n+"="+v+e+"; path=/";return true;}else if(typeof n==="object"&&typeof v==="undefined"){for(c in n) {if(n.hasOwnProperty(c)){document.cookie=c+"="+n[c]+e+"; path=/";}}return true;}return false;}
function rls(n){return localStorage[n];}
function rc(n){var nn, ca, i, c;nn=n+"=";ca=document.cookie.split(';');for(i=0;i<ca.length;i++){c=ca[i];while(c.charAt(0)===' '){c=c.substring(1,c.length);}if(c.indexOf(nn)===0){return c.substring(nn.length,c.length);}}return null;}
function dls(n){return delete localStorage[n];}
function dc(n){return wc(n,"",-1);}
$.extend({Storage: {
set: isLS ? wls : wc,
get: isLS ? rls : rc,
remove: isLS ? dls :dc
}
});
})($);

/**
* $.BuyMe: author Nazar Tokar
* www.dedushka.org
* Copyright 2013
**/

function buymeClearForm(){ 
	$("#b1c_nam").val($.Storage.get('b1c_nam'));
	$("#b1c_cnt").val($.Storage.get('b1c_cnt'));
} // чистим форму

function buymeShowForm(){ //скрываем и показываем форму
	$(".b1c_form").fadeToggle("slow");
	$(".b1c_result").html("");
	buymeClearForm();
}

function sendRequest() {
	var cnt = $.Storage.get('b1c_sent'); //getting last sent time from storage
	if (!cnt) { cnt = 0; }
	
	var captions = [];
	var options  = [];
	
	var pr_name = $(".b1c_name").html(); // product name
	if(!pr_name) pr_name = $("h1").html();
	captions.push("Товар");
	options.push(pr_name);
	
	$(".b1c_caption").each(function() {
		captions.push($(this).html());
	});
	
	$(".b1c_option").each(function() {
		options.push($(this).find(':selected').text());
	});

	$.getJSON("/buyme/index.php", {
		nam: $("#b1c_nam").val(),
		cnt: $("#b1c_cnt").val(),
		cmt: $("#b1c_msg").val(),
		url: location.href,
		lng: b1c_lang,
		time: cnt, 
		'options[]': options,
		'captions[]': captions
	}, function(data) {
		$(".b1c_result").html("<div class='" + data.cls + "'>" + data.message +"</div>");
		if (data.result == "ok") {
			$.Storage.set("b1c_sent", data.time);
			$.Storage.set("b1c_nam", $("#b1c_nam").val());
			$.Storage.set("b1c_cnt", $("#b1c_cnt").val());
			setTimeout( function(){ buymeShowForm(); }, 7000);
			setTimeout( function(){ buymeClearForm(); }, 10000);
		}
	});
}

$(function(){ // go-go!

$.ajaxSetup({'beforeSend' : function(xhr) { // выбираем кодировку
	xhr.overrideMimeType('text/html; charset=utf-8');
},
});

$.get("/buyme/lang/"+b1c_lang+".html", function(data) { // вставка формы
	$("body").append(data);
	$(".b1c_send").css("display", "none");
});

$(document).on("click", "#b1c", function(){
	$.Storage.set("b1c_nam", $("#b1c_nam").val());
	$.Storage.set("b1c_cnt", $("#b1c_cnt").val());
	$(".b1c_send").fadeIn("fast"); // show loading message
	sendRequest(); //send data
	return false;
});

function buymeShowForm(){ //скрываем и показываем форму
	$(".b1c_form").fadeToggle("fast");
	$(".b1c_result").html("");
	buymeClearForm();
}

$(document).on("click", ".b1c", function(){ buymeShowForm(); return false; }); // вкл-выкл форму

$(document).on("mouseover", ".b1c_close", function(){ // кнопка "закрыть"
	$(this).animate({ opacity: 0.8 }, 120);
}).on("mouseleave", ".b1c_close", function(){
	$(this).animate({ opacity: 1 }, 100);
}).on("click", ".b1c_close", function(){
	buymeShowForm();
	return false;
});

});