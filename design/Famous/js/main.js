jQuery(document).ready(function() {
    "use strict";


    /******************************************
       Newsletter popup
    ******************************************/

    jQuery('#myModal').appendTo("body");

    function show_modal() {
        jQuery('#myModal').modal('show');
    }

    jQuery('#myModal').modal({
        keyboard: false,
        backdrop: false
    });
    /******************************************
    	Mobile menu
    ******************************************/

    jQuery("#mobile-menu").mobileMenu({
            MenuWidth: 250,
            SlideSpeed: 300,
            WindowsMaxWidth: 767,
            PagePush: !0,
            FromLeft: !0,
            Overlay: !0,
            CollapseMenu: !0,
            ClassName: "mobile-menu"

        }),

        /******************************************
        	Our clients slider
        ******************************************/

        jQuery("#our-clients-slider .slider-items").owlCarousel({
            items: 6,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [360, 1],
            navigation: false,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: false,
            autoPlay: true
        }),

 /******************************************
           computer slider
  ******************************************/

        jQuery("#computer-slider .slider-items").owlCarousel({
            items: 4,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: false
        }),
		
        /******************************************
          smartphone slider
        ******************************************/

        jQuery("#smartphone-slider .slider-items").owlCarousel({
            items: 4,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: false
        }),


        /******************************************
        	watches slider
        ******************************************/

        jQuery("#watches-slider .slider-items").owlCarousel({
            items: 4,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: true
        }),

        /******************************************
        	daily deal slider
        ******************************************/

        jQuery("#daily-deal-slider .slider-items").owlCarousel({
            items: 1,
            itemsDesktop: [1024, 1],
            itemsDesktopSmall: [900, 1],
            itemsTablet: [640, 1],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: true
        }),
		
		/******************************************
        	Photo slider
        ******************************************/

        jQuery("#photo-slider .slider-items").owlCarousel({
            items: 4,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: true
        }),

        /******************************************
        	best sale slider
        ******************************************/
        jQuery("#jtv-best-sale-slider .slider-items").owlCarousel({
            items: 4, //10 items above 1000px browser width
            itemsDesktop: [1024, 4], //5 items between 1024px and 901px
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            navigation: true,
            navigationText: ["<a class=\"flex-prev\"></a>", "<a class=\"flex-next\"></a>"],
            slideSpeed: 500,
            pagination: false,
            autoPlay: true
        });
        /******************************************
        	toprate products slider
        ******************************************/
        jQuery("#toprate-products-slider .slider-items").owlCarousel({
             items: 1, //10 items above 1000px browser width
            itemsDesktop: [1024, 1], //5 items between 1024px and 901px
            itemsDesktopSmall: [900, 2], // 3 items betweem 900px and 601px
            itemsTablet: [767, 1], //2 items between 600 and 0;
            itemsMobile: [360, 1],
            navigation: false,
            navigationText: ["<a class=\"flex-prev\"></a>", "<a class=\"flex-next\"></a>"],
            slideSpeed: 500,
            pagination: true
        });

    /******************************************
    	Special products slider
    ******************************************/

    jQuery("#special-products-slider .slider-items").owlCarousel({
            items: 3,
            itemsDesktop: [1024, 3],
            itemsDesktopSmall: [900, 2],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: false
        }),


        /******************************************
        	on sale produc slider
        ******************************************/

        jQuery("#new-products-slider .slider-items").owlCarousel({
            items: 1, //10 items above 1000px browser width
            itemsDesktop: [1024, 1], //5 items between 1024px and 901px
            itemsDesktopSmall: [900, 2], // 3 items betweem 900px and 601px
            itemsTablet: [767, 1], //2 items between 600 and 0;
            itemsMobile: [360, 1],
            navigation: false,
            navigationText: ["<a class=\"flex-prev\"></a>", "<a class=\"flex-next\"></a>"],
            slideSpeed: 500,
            pagination: true
        });

    /******************************************
    	Latest news slider
    ******************************************/

    jQuery("#latest-news-slider .slider-items").owlCarousel({
            autoplay: !0,
            items: 4,
            itemsDesktop: [1024, 3],
            itemsDesktopSmall: [900, 2],
            itemsTablet: [640, 1],
            itemsMobile: [480, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            transitionStyle: "backSlide"
        }),
        /******************************************
        	testimonials slider
        ******************************************/

        jQuery("#testimonials-slider .slider-items").owlCarousel({
            items: 2,
            itemsDesktop: [1024, 2],
            itemsDesktopSmall: [900, 1],
            itemsTablet: [640, 1],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: false,
            autoPlay: true,
            singleItem: true
        }),

        /******************************************
        	Mega Menu
        ******************************************/

        jQuery('.mega-menu-title').on('click', function() {
            if (jQuery('.mega-menu-category').is(':visible')) {
                jQuery('.mega-menu-category').slideUp();
            } else {
                jQuery('.mega-menu-category').slideDown();
            }
        });


    jQuery('.mega-menu-category > .nav > li').hover(function() {
        jQuery(this).addClass("active");
        jQuery(this).find('.popup').stop(true, true).fadeIn('slow');
    }, function() {
        jQuery(this).removeClass("active");
        jQuery(this).find('.popup').stop(true, true).fadeOut('slow');
    });

    jQuery('.slider-range .saide-bar-menu ul > li').click(function(){
        $(this).find('ul').toggle(300);
    });


    jQuery('.mega-menu-category .nav > li.view-more').on('click', function(e) {
        if (jQuery('.mega-menu-category .nav > li.more-menu').is(':visible')) {
            jQuery('.mega-menu-category .nav > li.more-menu').stop().slideUp();
            jQuery(this).find('a').text('More category');
        } else {
            jQuery('.mega-menu-category .nav > li.more-menu').stop().slideDown();
            jQuery(this).find('a').text('Close menu');
        }
        e.preventDefault();
    });
    /******************************************
       Category desc slider
    ******************************************/

    jQuery("#category-desc-slider .slider-items").owlCarousel({
        autoPlay: true,
        items: 1, //10 items above 1000px browser width
        itemsDesktop: [1024, 1], //5 items between 1024px and 901px
        itemsDesktopSmall: [900, 1], // 3 items betweem 900px and 601px
        itemsTablet: [600, 1], //2 items between 600 and 0;
        itemsMobile: [320, 1],
        navigation: true,
        navigationText: ["<a class=\"flex-prev\"></a>", "<a class=\"flex-next\"></a>"],
        slideSpeed: 500,
        pagination: false
    });

    /******************************************
       Upsell product slider
    ******************************************/

    jQuery("#upsell-product-slider .slider-items").owlCarousel({
            items: 4,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: false
        }),

        /******************************************
        	Related product slider
        ******************************************/

        jQuery("#related-product-slider .slider-items").owlCarousel({
            items: 4,
            itemsDesktop: [1024, 4],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: true
        }),

        /******************************************
        	Related posts
        ******************************************/

        jQuery("#related-posts .slider-items").owlCarousel({
            items: 3,
            itemsDesktop: [1024, 3],
            itemsDesktopSmall: [900, 3],
            itemsTablet: [640, 2],
            itemsMobile: [390, 1],
            navigation: !0,
            navigationText: ['<a class="flex-prev"></a>', '<a class="flex-next"></a>'],
            slideSpeed: 500,
            pagination: !1,
            autoPlay: true
        }),


        /******************************************
            PRICE FILTER
        ******************************************/

        /*jQuery('.slider-range-price').each(function() {
            var min = jQuery(this).data('min');
            var max = jQuery(this).data('max');
            var unit = jQuery(this).data('unit');
            var value_min = jQuery(this).data('value-min');
            var value_max = jQuery(this).data('value-max');
            var label_reasult = jQuery(this).data('label-reasult');
            var t = jQuery(this);
            jQuery(this).slider({
                range: true,
                min: min,
                max: max,
                values: [value_min, value_max],
                slide: function(event, ui) {
                    var result = label_reasult + " " + unit + ui.values[0] + ' - ' + unit + ui.values[1];
                    console.log(t);
                    t.closest('.slider-range').find('.amount-range-price').html(result);
                }
            });
        })


         jQuery('.slider-range-price').each(function() {
         var min = jQuery(this).data('min');
         var max = jQuery(this).data('max');
         var unit = jQuery(this).data('unit');
         var value_min = jQuery(this).data('value-min');
         var value_max = jQuery(this).data('value-max');
         var label_reasult = jQuery(this).data('label-reasult');
         var t = jQuery(this);
         jQuery(this).slider({
         range: true,
         min: min,
         max: max,
         values: [value_min, value_max],
         slide: function(event, ui) {
         var result = label_reasult + " " + ui.values[0] + ' ' + unit + ' - ' + ui.values[1] + ' ' + unit;
         $('#min_price').attr("value", ui.values[0]);
         $('#max_price').attr("value", ui.values[1]);
         t.closest('.slider-range').find('.amount-range-price').html(result);
         },
         change:function(event,ui) {$('#slider_price').trigger('slider_price_change');}
         });
         });
        */

    /******************************************
        Footer expander
    ******************************************/

    jQuery(".collapsed-block .expander").on("click", function(e) {
        var collapse_content_selector = jQuery(this).attr("href");
        var expander = jQuery(this);
        if (!jQuery(collapse_content_selector).hasClass("open")) expander.addClass("open").html("&minus;");
        else expander.removeClass("open").html("+");
        if (!jQuery(collapse_content_selector).hasClass("open")) jQuery(collapse_content_selector).addClass("open").slideDown("normal");
        else jQuery(collapse_content_selector).removeClass("open").slideUp("normal");
        e.preventDefault()
    });

    /******************************************
        Category sidebar
    ******************************************/

    jQuery(function() {
        jQuery(".category-sidebar ul > li.cat-item.cat-parent > ul").hide();
        jQuery(".category-sidebar ul > li.cat-item.cat-parent.current-cat-parent > ul").show();
        jQuery(".category-sidebar ul > li.cat-item.cat-parent.current-cat.cat-parent > ul").show();
        jQuery(".category-sidebar ul > li.cat-item.cat-parent").on("click", function() {
            if (jQuery(this).hasClass('current-cat-parent')) {
                var li = jQuery(this).closest('li');
                li.find(' > ul').slideToggle('fast');
                jQuery(this).toggleClass("close-cat");
            } else {
                var li = jQuery(this).closest('li');
                li.find(' > ul').slideToggle('fast');
                jQuery(this).toggleClass("cat-item.cat-parent open-cat");
            }
        });
        jQuery(".category-sidebar ul.children li.cat-item,ul.children li.cat-item > a").on("click", function(e) {
            e.stopPropagation();
        });
    });

    /******************************************
        colosebut
    ******************************************/

    jQuery("#colosebut1").on("click", function() {
        jQuery("#div1").fadeOut("slow");
    });
    jQuery("#colosebut2").on("click", function() {
        jQuery("#div2").fadeOut("slow");
    });
    jQuery("#colosebut3").on("click", function() {
        jQuery("#div3").fadeOut("slow");
    });
    jQuery("#colosebut4").on("click", function() {
        jQuery("#div4").fadeOut("slow");
    });


    /******************************************
        totop
    ******************************************/
    if (jQuery('#back-to-top').length) {
        var scrollTrigger = 100, // px
            backToTop = function() {
                var scrollTop = jQuery(window).scrollTop();
                if (scrollTop > scrollTrigger) {
                    jQuery('#back-to-top').addClass('show');
                } else {
                    jQuery('#back-to-top').removeClass('show');
                }
            };
        backToTop();
        jQuery(window).on('scroll', function() {
            backToTop();
        });
        jQuery('#back-to-top').on('click', function(e) {
            e.preventDefault();
            jQuery('html,body').animate({
                scrollTop: 0
            }, 700);
        });
    }
    /******************************************
        tooltip
    ******************************************/


    jQuery('[data-toggle="tooltip"]').tooltip();

    /* ---------------------------------------------
        slider typist
    --------------------------------------------- */

    if (typeof Typist == 'function') {
        new Typist(document.querySelector('.typist-element'), {
            letterInterval: 60,
            textInterval: 3000
        });
    }

    jQuery('select[name=variant]').each(function(li,el){
		
        var price = $(el).find('option:selected').attr('price');
        var compare_price = '';
        if(typeof $(el).find('option:selected').attr('compare_price') == 'string')
            compare_price = $(this).find('option:selected').attr('compare_price');
        if(typeof $(el).find('option:selected').attr('discount') == 'string')
            var discount = $(el).find('option:selected').attr('discount');

        jQuery(el).closest('.prod').find('.special-price span.price').html(price + " руб");
        jQuery(el).closest('.prod').find('.old-price span.price').html(compare_price + " руб");
        
    });


    // Выбор вариантов
    jQuery('select[name=variant]').change(function() {
        var price = $(this).find('option:selected').attr('price');
        var compare_price = '';
        if(typeof $(this).find('option:selected').attr('compare_price') == 'string')
            compare_price = $(this).find('option:selected').attr('compare_price');
        if(typeof $(this).find('option:selected').attr('discount') == 'string')
            var discount = $(this).find('option:selected').attr('discount');

        jQuery(this).closest('.prod').find('.special-price span.price').html(price + " руб");
        jQuery(this).closest('.prod').find('.old-price span.price').html(compare_price + " руб");
        return false;
    });


    // Аяксовая корзина список товаров.
    $('form.variants').on('submit', function(e) {
        e.preventDefault();
        var button = $(this).find('input[type="submit"]');
        if($(this).find('input[name=variant]:checked').size()>0)
            var variant = $(this).find('input[name=variant]:checked').val();
        if($(this).find('select[name=variant]').size()>0)
            variant = $(this).find('select').val();
        $.ajax({
            url: "ajax/cart.php",
            data: {variant: variant,amount: $(this).find('input[name="amount"]').val()},
            dataType: 'json',
            success: function(data){
                $('#cart_informer').html(data);
                alertify.success('Товар добавлен!');
            }
        });
        var o1 = $(this).offset();
        var o2 = $('#cart_informer').offset();
        var dx = o1.left - o2.left;
        var dy = o1.top - o2.top;
        var distance = Math.sqrt(dx * dx + dy * dy);
        $(this).closest('.product-item').find('.pr-img-area .first-img').effect("transfer", { to: $("#cart_informer"), className: "transfer_class" }, distance);
        $('.transfer_class').html($(this).closest('.product-item').find('.pr-img-area').html());
        $('.transfer_class').find('img').css('height', '100%');
        return false;
    });


    // Аяксовая корзина детальная стр.
    $('form.variants2').on('submit', function(e) {
        e.preventDefault();
        var button = $(this).find('input[type="submit"]');
        if($(this).find('input[name=variant]:checked').size()>0)
            var variant = $(this).find('input[name=variant]:checked').val();
        if($(this).find('select[name=variant]').size()>0)
            variant = $(this).find('select').val();
        $.ajax({
            url: "ajax/cart.php",
            data: {variant: variant,amount: $(this).find('input[name="amount"]').val()},
            dataType: 'json',
            success: function(data){
                $('#cart_informer').html(data);
                alertify.success('Товар добавлен!');
            }
        });
        var o1 = $(this).offset();
        var o2 = $('#cart_informer').offset();
        var dx = o1.left - o2.left;
        var dy = o1.top - o2.top;
        var distance = Math.sqrt(dx * dx + dy * dy);
        $(this).closest('.product-view-area').find('.product-big-image .zoom-img').effect("transfer", { to: $("#cart_informer"), className: "transfer_class" }, distance);
        $('.transfer_class').html($(this).closest('.product-view-area').find('.product-big-image').html());
        $('.transfer_class').find('img').css('height', '100%');
        return false;
    });


    // Добавление товара к сравнению
    $('.add_to_compare').on('click', function(e) {
        var val = $(this).attr("data-id");
        $.ajax({
            url: "ajax/compare.php",
            data: {compare: val},
            dataType: 'json',
            success: function(data){
                if(data){
                    console.log(data);
                    $('#compare_informer').html(data);
                    if(parseInt($(data,"a").attr("compare-total")) == 6){
                        alertify.success('Не более 6 товаров в сравнении!');
                    }else{
                        alertify.success('Товар в сравнении!');
                    }
                }
            }
        });
        return false;
    });


    $(".short-by select").change(function(){
        if($(this).val()){
            window.location.href = $(this).val();
        }
        return false;
    });

    $('input[autocomplete="tel"]').mask('+7(999) 999 99 99');

    $('#shop-popup').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) ;
        var recipient = button.data('whatever');
        var metrika = button.data('metrika');
        var goal = button.data('goal');

        var modal = $(this);

        modal.find('form').submit(function(){
            try {
                ym(metrika, 'reachGoal', goal, function(){
                    console.log(goal + " send!");
                });
            } catch(e) {
                console.log("Ошибка метрики" + e);
            }
            
            jQuery.getJSON("/callme/index.php",
                $.extend(getFormData($(this)), {url: location.href})
                , function(i) {
                    if(i.result == "success"){
                        $(modal).modal('hide');
                        var success = $('#success');
                        success.find('.modal-body .alert').text(i.message);
                        success.modal('show');
                        setTimeout(function(){
                            location.reload();
                        }, 2000);
                    }else{
                        $(modal).modal('hide');
                        alertify.error('Ошибка отправки!');
                    }
            });
            return false;
        });
        modal.find('.modal-title').text(recipient);
    });


    $(window).scroll(function() {
        if($(this).width() >= 768){
            var header = $('.header-container');
            var h = header.height();
            if($(this).scrollTop() > h){
                header.parent().css('height',h);
                header.addClass('fixed');
            }else{
                header.parent().removeAttr('style');
                header.removeClass('fixed');
            }
        }
    });

});

jQuery(function(){
    $('.checkout-btn').prop('disabled', true);
    $('.checkout-btn').addClass('checkout-btn_disabled');

    $('.agree_checkbox').on('change',function(){
        if($(this).is( ":checked" )){
            $('.checkout-btn').prop('disabled', false);
            $('.checkout-btn').removeClass('checkout-btn_disabled');
        }else{
            $('.checkout-btn').prop('disabled', true);
            $('.checkout-btn').addClass('checkout-btn_disabled');
        }
    });
});

function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}



