/* Start */
$(document).ready(function() {
		var sendRating = function(event) {
			var $this = $(this);
			var $win = $("#elementError");
			var trig = event.data.dest == "good" ? true : false;

			$.getJSON(ajaxPath + "?act=rating&id=" + $this.data("id") + "&trig=" + trig, function(data) {
				if (data["result"]) {
					$this.find("span").html(
						parseInt($this.find("span").html()) + 1
					);
				} else {
					$win.show().find("p").text(data["error"]).parent().find(".heading").text(data["heading"]);
				}
			});

			event.preventDefault();
		};

		var calcRating = function(event) {
			var $this = $(this);
			var $mover = $this.find(".m");
			var $ratingInput = $("#ratingInput");
			var position = $this.offset().left;
			var curWidth = $this.width() / 5;
			var value = Math.ceil((event.pageX - position) / curWidth);

			$mover.stop().css({
				"width": (value * 20) + "%"
			});

			if (event.data.action) {
				$ratingInput.val(value);
			};

		};

		var callRating = function(event) {
			var $this = $(this);
			var $ratingInput = $("#ratingInput");
			var value = $ratingInput.val() != "" ? parseInt($ratingInput.val()) : 0;

			clearTimeout(flushTimeout);
			flushTimeout = setTimeout(function() {
				$this.find(".m").css({
					"width": (value * 20) + "%"
				})
			}, 500);
		};

		var usedSelect = function(event) {
			var $this = $(this);
			var $ul = $(".usedSelect");
			var usedInput = $("#usedInput");

			$ul.find("a").removeClass("selected");
			$this.addClass("selected");
			$("#usedInput").val($this.data("id"));

			event.preventDefault();
		};

		var reviewSubmit = function(event) {
			var $this = $(this);
			var $form = $(this).parents("form");
			var formData = $form.serialize();
			var $win = $("#elementError");

			$.getJSON(ajaxPath + "?act=newReview&" + formData + "&iblock_id=" + $this.data("id"), function(data) {
				$win.show().find("p").text(data["message"]).parent().find(".heading").text(data["heading"]);
				data["reload"] ? $win.data("reload", 1) : void 0;
			});

			event.preventDefault();
		};

		var windowClose = function(event) {
			var $win = $("#elementError");
			$win.data("reload") ? document.location.reload() : $("#elementError").hide();
			event.preventDefault();
		};

		var productToolsMaker = function() {
			var currElemsWidth = 0;
			var $el = $("#productStatsControls"),
				$elems = $el.find("li").show();

			$elems.each(function() {
				var $this = $(this);
				currElemsWidth = currElemsWidth + $this.outerWidth(true) + 5;
				if (currElemsWidth > $el.outerWidth()) {
					$this.hide();
				}
			});
		}

		$(".heading.trigger").on("click", function(e) {
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

			e.preventDefault();
		});

		$(".scrollTo").on("click", function(e) {
			var $target = $(this.getAttribute("href")),
				targetPos = $target.offset().top + 1;

			$("html, body").animate({
				scrollTop: targetPos
			});

			if ($target.hasClass("collapsedBlock")) {
				$target.find(".heading").addClass("opened");
				$target.find(".collapsedContent").addClass("opened");
			};

			e.preventDefault();
		});

		productToolsMaker();

		$(window).on("resize", productToolsMaker);

		$(document).on("click", ".good", {
			dest: "good"
		}, sendRating);
		$(document).on("click", ".bad", {
			dest: "bad"
		}, sendRating);

		//rating review
		$(document).on("mousemove", "#newRating .rating", {action: false}, calcRating);
		$(document).on("mouseleave", "#newRating .rating", callRating)
		$(document).on("click", "#newRating .rating", {action: true}, calcRating);
		$(document).on("click", ".usedSelect a", usedSelect);
		$(document).on("click", "#newReview .submit", reviewSubmit);
		$(document).on("click", "#elementErrorClose, #elementError .close", windowClose);
});

$(window).on("load", function(){
	$("#productPicsSlider").electroSlider({
		speed: 500,
		secondDots: "#elementMorePhoto"
	});
});
/* End */