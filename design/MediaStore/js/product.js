var detail_previevtext_settings;
var detail_previevtext_pane;
var detail_previevtext_api;

function RSAL_RefresDetailjJScollPane(){
	// jScrollPane
	detail_previevtext_settings = {};
	detail_previevtext_pane = $('.scroll_detail_previevtext');
	detail_previevtext_pane.jScrollPane(detail_previevtext_settings);
	detail_previevtext_api = detail_previevtext_pane.data('jsp');
	// /jScrollPane
}

function RSAL_SliderMoveSelec($link){//deprecated
	var index = $link.attr('href');
	var newLeftPos = 3 + 100*index;
	$link.parents('.js-element').find( ".selected_block" ).animate({left:newLeftPos},400);
}

$(document).ready(function(){
	// jScrollPane
	RSAL_RefresDetailjJScollPane();
	// /jScrollPane
	
	// switch ext images
	$(document).on('click','.catalog-element-extimages_slider .image',function(){
		$extimages = $(this).parents('.catalog-element-extimages_slider');
		$extimages.find('.around_image.selected').removeClass('selected');
		$(this).parents('.around_image').addClass('selected').parents('.js-element').find('.image_for_watch').attr('src', $(this).data('bigimagesrc'));
		$extimages.find( ".selected_block" ).animate({left: 3 + 100 * $extimages.find('.around_image.selected').index('.around_image:visible')}, 400);
		return false;
	});
	
	// quantity and store
	$(document).on('mouseenter','.catalog-element-quantity .quantity_empty .status, .catalog-element-quantity .quantity_isset .status',function(){
		var $obj = $(this);
		$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').show().animate({
			opacity:1,
			bottom:'22'
		}, 100, function() {
			// Animation complete.
		});
	}).on('mouseleave','.catalog-element-quantity .quantity_empty .status, .catalog-element-quantity .quantity_isset .status',function(){
		var $obj = $(this);
		$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').animate({
			opacity:0,
			bottom:'100'
		}, 250, function() {
			$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').hide();
			// Animation complete.
		});
	}).on('click','.catalog-element-quantity .quantity_empty .status, .catalog-element-quantity .quantity_isset .status',function(){
		var $obj = $(this);
		if($obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').css('display')=="none")
		{
			$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').css({"opacity":"0","bottom":"100px"}).show().animate({
				opacity:1,
				bottom:'22'
			}, 100, function() {
				// Animation complete.
			});
		} else {
			$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').addClass('shadow');
			setTimeout(function(){
				$obj.parents('.catalog-element-quantity').find('.catalog-element-quantity-popup').removeClass('shadow');
			},200);
		}
		return false;
	});
	$(document).on('click','.catalog-element-quantity-popup',function(){
		var $popup = $(this);
		$popup.animate({
			opacity:0,
			bottom:'100'
		}, 250, function() {
			$popup.hide();
			// Animation complete.
		});
		return false;
	});
	
	// size table
	$(document).on('click','.offer_prop.size .size_table a',function(){
		var $obj = $(this);
		if(!$obj.parents('.size_table').find('.catalog-element-size_table-popup').is(':visible'))
		{
			$obj.parents('.size_table').find('.catalog-element-size_table-popup').show().animate({
				opacity:1,
				bottom:'22'
			}, 100, function() {
				// Animation complete.
			});
		} else {
			$obj.parents('.size_table').find('.catalog-element-size_table-popup').addClass('shadow');
			setTimeout(function(){
				$obj.parents('.size_table').find('.catalog-element-size_table-popup').removeClass('shadow');
			},200);
		}
		return false;
	});
	$(document).on('click','.catalog-element-size_table-popup',function(){
		var $popup = $(this);
		$popup.animate({
			opacity:0,
			bottom:'100'
		}, 250, function(){
			$popup.hide();
			// Animation complete.
		});
		return false;
	});
	$(document).on('click',function(){
		var $obj = $(this);
		if($('.catalog-element-size_table-popup').is(':visible'))
		{
			$('.catalog-element-size_table-popup').show().animate({
				opacity:0,
				bottom:'100'
			}, 100, function() {
				$('.catalog-element-size_table-popup').hide();
				// Animation complete.
			});
		}
	});
	
	// buy1click
	$(document).on('click','.js-buy1click',function(){
		var sValue = '',
			$catalog_element = $(this).parents('.catalog-element'),
			product_url = $catalog_element.hasClass('is_popup') ? window.location.protocol+'//'+window.location.host+$catalog_element.find('.go2detail_from_popup').attr('href') : window.location.href;
		sValue = sValue + RSAL_Buy1click_SetData($catalog_element.data('elementid'), $(this).data('name'), product_url);
		$('#buy1click').find('textarea.order_list').text(sValue);
	});

// ***
    $(function() {
    	if($('.slimscroll').height() > 465){
            $('.slimscroll').slimScroll({
                height: '465px'
            });
		}
    });

    /*! Copyright (c) 2011 Piotr Rochala (http://rocha.la)
     * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
     * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
     *
     * Version: 0.3.0
     *
     */
    (function($) {

        jQuery.fn.extend({
            slimScroll: function(o) {

                var ops = o;
                //do it for every element that matches selector
                this.each(function(){

                    var isOverPanel, isOverBar, isDragg, queueHide, barHeight,
                        divS = '<div></div>',
                        minBarHeight = 30,
                        releaseScroll = false,
                        o = ops || {},
                        wheelStep = parseInt(o.wheelStep) || 20,
                        cwidth = o.width || '100%',
                        cheight = o.height || 'auto',
                        size = o.size || '7px',
                        // color = o.color || '#000',
                        color = o.color || '#086bbc',
                        position = o.position || 'right',
                        distance = o.distance || '1px',
                        start = o.start || 'top',
                        opacity = o.opacity || .4,
                        alwaysVisible = true || o.alwaysVisible === true,
                        railVisible = o.railVisible || true,
                        railColor = o.railColor || '#333',
                        railOpacity = o.railOpacity || 0.2;

                    //used in event handlers and for better minification
                    var me = $(this);
                    var parent = me.parent();

                    //wrap content
                    var wrapper = me.parent().addClass('slimScrollDiv');

                    //update style for the div
                    parent.css({
                        overflow: 'hidden',
                    });

                    me.css({
                        overflow: 'hidden',
                        height:'100%'
                    });

                    //create scrollbar rail
                    var rail  = $(divS).css({
                        width: size,
                        height: '100%',
                        position: 'absolute',
                        top: 0,
                        display: (alwaysVisible && railVisible) ? 'block' : 'none',
                        'border-radius': size,
                        background: railColor,
                        opacity: railOpacity,
                        zIndex: 90
                    });

                    //create scrollbar
                    var bar = $(divS).attr({
                        'class': 'slimScrollBar ',
                        style: 'border-radius: ' + size
                    }).css({
                        background: color,
                        width: size,
                        position: 'absolute',
                        top: 0,
                        opacity: opacity,
                        display: alwaysVisible ? 'block' : 'none',
                        BorderRadius: size,
                        MozBorderRadius: size,
                        WebkitBorderRadius: size,
                        zIndex: 99
                    });

                    //set position
                    var posCss = (position == 'right') ? { right: distance } : { left: distance };
                    rail.css(posCss);
                    bar.css(posCss);

                    //wrap it
                    //me.wrap(wrapper);

                    //append to parent div
                    parent.append(bar);
                    parent.append(rail);

                    //make it draggable
                    bar.draggable({
                        axis: 'y',
                        containment: 'parent',
                        start: function() { isDragg = true; },
                        stop: function() { isDragg = false; hideBar(); },
                        drag: function(e)
                        {
                            //scroll content
                            scrollContent(0, $(this).position().top, false);
                        }
                    });

                    //on rail over
                    rail.hover(function(){
                        showBar();
                    }, function(){
                        hideBar();
                    });

                    //on bar over
                    bar.hover(function(){
                        isOverBar = true;
                    }, function(){
                        isOverBar = false;
                    });

                    //show on parent mouseover
                    me.hover(function(){
                        isOverPanel = true;
                        showBar();
                        hideBar();
                    }, function(){
                        isOverPanel = false;
                        hideBar();
                    });

                    var _onWheel = function(e)
                    {
                        //use mouse wheel only when mouse is over
                        if (!isOverPanel) { return; }

                        var e = e || window.event;

                        var delta = 0;
                        if (e.wheelDelta) { delta = -e.wheelDelta/120; }
                        if (e.detail) { delta = e.detail / 3; }

                        //scroll content
                        scrollContent(delta, true);

                        //stop window scroll
                        if (e.preventDefault && !releaseScroll) { e.preventDefault(); }
                        if (!releaseScroll) { e.returnValue = false; }
                    }

                    var scrollContent = function(y, isWheel, isJump)
                    {
                        var delta = y;

                        if (isWheel)
                        {
                            //move bar with mouse wheel
                            delta = bar.position().top + y * wheelStep;

                            //move bar, make sure it doesn't go out
                            delta = Math.max(delta, 0);
                            var maxTop = parent.outerHeight() - bar.outerHeight();
                            delta = Math.min(delta, maxTop);

                            //scroll the scrollbar
                            bar.css({ top: delta + 'px' });
                        }

                        //calculate actual scroll amount
                        var percentScroll = parseInt(bar.position().top) / (parent.outerHeight() - bar.outerHeight());
                        delta = percentScroll * (me[0].scrollHeight - parent.outerHeight());

                        if (isJump)
                        {
                            delta = y;
                            var offsetTop = delta / me[0].scrollHeight * parent.outerHeight();
                            bar.css({ top: offsetTop + 'px' });
                        }

                        //scroll content
                        me.scrollTop(delta);


                        //ensure bar is visible
                        showBar();
                    }

                    var attachWheel = function()
                    {
                        if (window.addEventListener)
                        {
                            this.addEventListener('DOMMouseScroll', _onWheel, false );
                            this.addEventListener('mousewheel', _onWheel, false );
                        }
                        else
                        {
                            document.attachEvent("onmousewheel", _onWheel)
                        }
                    }

                    //attach scroll events
                    attachWheel();

                    var getBarHeight = function()
                    {
                        //calculate scrollbar height and make sure it is not too small
                        barHeight = Math.max((parent.outerHeight() / me[0].scrollHeight) * parent.outerHeight(), minBarHeight);
                        bar.css({ height: barHeight + 'px' });
                    }

                    //set up initial height
                    getBarHeight();

                    var showBar = function()
                    {
                        //recalculate bar height
                        getBarHeight();
                        clearTimeout(queueHide);

                        //show only when required
                        if(barHeight >= me.outerHeight()) {
                            //allow window scroll
                            releaseScroll = true;
                            return;
                        }
                        bar.fadeIn('fast');
                        if (railVisible) { rail.fadeIn('fast'); }
                    }

                    var hideBar = function()
                    {
                        //only hide when options allow it
                        if (!alwaysVisible)
                        {
                            queueHide = setTimeout(function(){
                                if (!isOverBar && !isDragg)
                                {
                                    bar.fadeOut('slow');
                                    rail.fadeOut('slow');
                                }
                            }, 1000);
                        }
                    }

                    //check start position
                    if (start == 'bottom')
                    {
                        //scroll content to bottom
                        bar.css({ top: 'auto', bottom: 0 });
                        scrollContent(0, true);
                    }
                    else if (typeof start == 'object')
                    {
                        //scroll content
                        scrollContent($(start).position().top, null, true);

                        //make sure bar stays hidden
                        if (!alwaysVisible) { bar.hide(); }
                    }
                });

                //maintain chainability
                return this;
            }
        });

        jQuery.fn.extend({
            slimscroll: jQuery.fn.slimScroll
        });

    })(jQuery);

// ***
});