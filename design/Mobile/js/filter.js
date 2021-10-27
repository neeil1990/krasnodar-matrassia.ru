/* Start */

//Range Slider
$(window).bind('load', function(){

	var filter = $("#smartFilter");
	var filterEl = $("#smartFilter input[type=checkbox]");

	$smFilter = $("#smartFilterForm");

	var $html = $("html");
	var $backdrop = $("#backdrop");
	var $layout = $("#layout");
	var $swClose = $("#swClose");

	var openFilter = function(event){

		rScroll = $(window).scrollTop();

		$backdrop.fadeIn();
		$layout.addClass("opened");

		$html.addClass("bx-menu").hasClass("bx-transform") ? $smFilter.addClass("opened") : $smFilter.animate({left: "0"}, 100);
		$swClose.addClass("sm");

		return event.preventDefault(elOpen["filter"] = true);
	};

	$(document).on("click", "#showFilter", openFilter);


	$(filterEl).change(function(){
		smartFilter.click(this, (
			$(this).offset().top - $(filter).offset().top)
		);
	});

	$("#set_filter, #modef_send").click(function(){
		$("#smartFilterForm").append('<input type="hidden" name="set_filter" value="Y">');
		$("#smartFilterForm").submit();
	});

	$("#del_filter, #resetParamFilter").click(function(){
		$("#smartFilterForm").append('<input type="hidden" name="del_filter" value="Y">');
		$("#smartFilterForm").submit();
	});

	filter.find(".close").click(function(e){
		$("#modef").hide();
		e.preventDefault();
	})

	$(document).on("click", ".showALL", function(event){
		var $this = $(this);
		var $elements = $this.siblings("ul").find("li");
		if($elements.filter(".off").length > 0){
			$elements.removeClass("off");
			$this.html(LANG["HIDE_ALL"] + " (" + ($elements.length - 5) + ")");
		}else{
			$elements.slice(5).addClass("off");
			$this.html(LANG["SHOW_ALL"] + " (" + $elements.length + ")");			
		}
		event.preventDefault();
	});

});

function JCSmartFilter(ajaxURL)
{
	this.ajaxURL = ajaxURL;
	this.form = null;
	this.timer = null;
}

JCSmartFilter.prototype.keyup = function(input)
{
	if(this.timer)
		clearTimeout(this.timer);
	this.timer = setTimeout(BX.delegate(function(){
		this.reload(input);
	}, this), 300);
}

JCSmartFilter.prototype.click = function(checkbox, pos)
{
	this.pos = pos;
	if(this.timer)
		clearTimeout(this.timer);
	this.timer = setTimeout(BX.delegate(function(){
		this.reload(checkbox,pos);
	}, this), 100);
}

JCSmartFilter.prototype.reload = function(input)
{	
	if(this.pos == undefined){
		this.pos = BX.pos(input, true);
	} 

	this.form = BX.findParent(input, {'tag':'form'});
	if(this.form)
	{
		var values = new Array;
		values[0] = {name: 'ajax', value: 'y'};
		this.gatherInputsValues(values, BX.findChildren(this.form, {'tag':'input'}, true));
		BX.ajax.loadJSON(
			this.ajaxURL,
			this.values2post(values),
			BX.delegate(this.postHandler, this)
		);
	}
}

JCSmartFilter.prototype.postHandler = function (result)
{
	if(result.ITEMS)
	{
		for(var PID in result.ITEMS)
		{
			var arItem = result.ITEMS[PID];
			if(arItem.PROPERTY_TYPE == 'N' || arItem.PRICE)
			{
			}
			else if(arItem.VALUES)
			{
				for(var i in arItem.VALUES)
				{
					var ar = arItem.VALUES[i];
					var control = BX(ar.CONTROL_ID);
					if(control)
					{
						control.parentNode.className = ar.DISABLED? 'lvl2 lvl2_disabled': 'lvl2';
					}
				}
			}
		}
		var modef = BX('modef');
		var modef_num = BX('modef_num');
		if(modef && modef_num)
		{
			modef_num.innerHTML = result.ELEMENT_COUNT;
			var hrefFILTER = BX.findChildren(modef, {tag: 'A'}, true);

			if(result.FILTER_URL && hrefFILTER)
				hrefFILTER[0].href = BX.util.htmlspecialcharsback(result.FILTER_URL);

			if(result.FILTER_AJAX_URL && result.COMPONENT_CONTAINER_ID)
			{
				BX.bind(hrefFILTER[0], 'click', function(e)
				{
					var url = BX.util.htmlspecialcharsback(result.FILTER_AJAX_URL);
					BX.ajax.insertToNode(url, result.COMPONENT_CONTAINER_ID);
					return BX.PreventDefault(e);
				});
			}

			if (result.INSTANT_RELOAD && result.COMPONENT_CONTAINER_ID)
			{
				var url = BX.util.htmlspecialcharsback(result.FILTER_AJAX_URL);
				BX.ajax.insertToNode(url, result.COMPONENT_CONTAINER_ID);
			}
			else
			{
				if(modef.style.display == 'none')
					modef.style.display = 'block';
				if(this.pos.top == undefined){
					modef.style.top = (this.pos - 12) + 'px';
				}else{
					modef.style.top = (this.pos.top -12) + 'px';
				}
				delete this.pos; 
			}
		}
	}
}

JCSmartFilter.prototype.gatherInputsValues = function (values, elements)
{
	if(elements)
	{
		for(var i = 0; i < elements.length; i++)
		{
			var el = elements[i];
			if (el.disabled || !el.type)
				continue;

			switch(el.type.toLowerCase())
			{
				case 'text':
				case 'textarea':
				case 'password':
				case 'hidden':
				case 'select-one':
					if(el.value.length)
						values[values.length] = {name : el.name, value : el.value};
					break;
				case 'radio':
				case 'checkbox':
					if(el.checked)
						values[values.length] = {name : el.name, value : el.value};
					break;
				case 'select-multiple':
					for (var j = 0; j < el.options.length; j++)
					{
						if (el.options[j].selected)
							values[values.length] = {name : el.name, value : el.options[j].value};
					}
					break;
				default:
					break;
			}
		}
	}
}

JCSmartFilter.prototype.values2post = function (values)
{
	var post = new Array;
	var current = post;
	var i = 0;
	while(i < values.length)
	{
		var p = values[i].name.indexOf('[');
		if(p == -1)
		{
			current[values[i].name] = values[i].value;
			current = post;
			i++;
		}
		else
		{
			var name = values[i].name.substring(0, p);
			var rest = values[i].name.substring(p+1);
			if(!current[name])
				current[name] = new Array;

			var pp = rest.indexOf(']');
			if(pp == -1)
			{
				//Error - not balanced brackets
				current = post;
				i++;
			}
			else if(pp == 0)
			{
				//No index specified - so take the next integer
				current = current[name];
				values[i].name = '' + current.length;
			}
			else
			{
				//Now index name becomes and name and we go deeper into the array
				current = current[name];
				values[i].name = rest.substring(0, pp) + rest.substring(pp+1);
			}
		}
	}
	return post;
}

$(document).on("ready", function(event){
	$(".heading.trigger").on("click", function(event) {
		var $this = $(this),
			$hiddenContent = $this.siblings(".collapsedContent");

		if ($this.hasClass("opened")) {
				$this.removeClass("opened");
				$hiddenContent.stop().slideUp("fast", function() {
					$hiddenContent.removeClass("opened");
				});
		} else {
			$this.addClass("opened");
			$hiddenContent.stop().slideDown("fast", function(){
				$hiddenContent.addClass("opened");
			});
		}

		event.preventDefault();
	});

	var $dropdownTrigger = $(".dropdown .currValue"),
		$dropdownLink = $dropdownTrigger.parent().find(".dropdownList a");

	$dropdownTrigger.on("click", function(event) {
		var $this = $(this),
			$optionsList = $this.siblings(".dropdownList");

		$this.toggleClass("active");
		$optionsList.toggleClass("opened");
		event.preventDefault();
	});

	$dropdownLink.on("click", function(event) {
		var $this = $(this),
			$currList = $this.parent().parent(),
			$placeholder = $currList.siblings(".currValue"),
			opt = $this.text();

		$currList.find(".current").removeClass("current");
		$this.addClass("current");
		$placeholder.text(opt);
		$dropdownTrigger.trigger("click");
		document.location.href = $this.attr("href");
		event.preventDefault();
	});

});
/* End */