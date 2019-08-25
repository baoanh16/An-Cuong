$(document).ready(function() {
	var speed = 500;
	$(".have-children a").each(function() {
		$(this).click(function(e) {
			e.stopPropagation();
			$(this)
				.siblings("ul")
				.slideToggle();
		});
	});

	$(".qty-minus").click(function() {
		var val = $(".product-details-quantity").val();
		if (val > 0) {
			$(".product-details-quantity").val(val - 1);
		} else {
			$(".product-details-quantity").val(0);
		}
	});
	$(".qty-plus").on("click", function() {
		var val = Number($(".product-details-quantity").val());
		$(".product-details-quantity").val(val + 1);
	});
	$(".btn-inc").on("click", function() {
		var val = Number(
			$(this)
				.prev()
				.val()
		);
		$($(this).prev()).val(val + 1);
		$(this)
			.prev()
			.trigger("change");
	});
	$(".btn-dec").click(function() {
		var val = $($(this).next()).val();
		if (val > 0) {
			$($(this).next()).val(val - 1);
		} else {
			$($(this).next()).val(0);
		}
		$(this)
			.next()
			.trigger("change");
	});

	if ($("#ttmh").attr("checked", true)) {
		$(".user-info").slideUp();
	}
	$("#ttmh").on("change", function() {
		$(".user-info").slideToggle();
	});

	swiperInit();
	checkMarrk();
	$(".sidebar-toggle").click(function() {
		$(".sidebar-index-wrappper").slideToggle();
	});
	$(".social-network").jsSocials({
		showLabel: false,
		shares: [
			"facebook",
			"twitter",
			"pinterest",
			{
				share: "email",
				label: "",
				logo: "fa fa-envelope-open"
			}
		]
	});
	$(".filter-title").each(function() {
		$(this).click(function() {
			$(this)
				.next()
				.slideToggle();
			$(this).toggleClass("active");
		});
	});
	$("#ddlProvince, #ddlDistrict").change(function(e) {
		$("#edit-submit").trigger("click");
	});
	$("#address").on("keyup", function(event) {
		if (event.keyCode === 13) {
			$("#edit-submit").trigger("click");
		}
	});
	$(".gioi-thieu .horizontal-nav li a").click(function() {
		let section = $(this).attr("href");
		$("html, body").animate(
			{
				scrollTop: $(section).offset().top
			},
			500
		);
	});
	$(".product-tabs .tabs").tabslet({
		animation: true
	});

	$(".productpage .Module-265")
		.before($(".product-filter-wrapper"))
		.before($(".Module-246"));
	$(".productpage .Module-227").after($(".Module-228"));
	$(".product-detail-page .product-detail")
		.before($(".product-filter-wrapper"))
		.before($(".Module-246"));
	$(".product-detail-page .product-slide").after($(".Module-228"));
});

function swiperInit() {
	var mySwiper = new Swiper("#index-swiper", {
		direction: "horizontal",
		slidesPerView: 1,
		loop: true,
		autoplay: {
			delay: 3500
		},
		speed: 1300,
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev"
		}
	});

	var mySwiper2 = new Swiper(".index-news-swiper .swiper-container", {
		direction: "horizontal",
		slidesPerView: 1,
		loop: true,
		autoplay: {
			delay: 3500
		},
		navigation: {
			nextEl: ".index-news-swiper-prev",
			prevEl: ".index-news-swiper-next"
		}
	});

	var indexSwiperCatalouge = new Swiper(
		".index-guide-swiper-wrapper .swiper-container",
		{
			direction: "horizontal",
			slidesPerView: 1,
			loop: true,
			navigation: {
				nextEl: ".swiper-catelogue-next",
				prevEl: ".swiper-catelogue-prev"
			},
			autoplay: {
				delay: 3500
			},
			speed: 1300,
			breakpoints: {
				768: {
					slidesPerView: 3
				}
			}
		}
	);
	// mySwiperPartner.autoplay.start();
	var swiperPartner = new Swiper(".index-news-partner .swiper-container", {
		direction: "vertical",
		slidesPerView: 4,
		autoplay: {
			delay: 1500
		},
		speed: 700,
		loop: true,
		breakpoints: {
			1025: {
				direction: "horizontal",
				spaceBetween: 10
			},
			576: {
				direction: "horizontal",
				spaceBetween: 10,
				slidesPerView: 2
			}
		}
	});

	var galleryThumbs = new Swiper(".swiper-product-thumbs .swiper-container", {
		spaceBetween: 10,
		slidesPerView: 4,
		direction: "vertical",
		autoHeight: false,
		touchRatio: 0.2,
		slideToClickedSlide: true,
		breakpoints: {
			1025: {
				direction: "horizontal"
			}
		}
	});
	var galleryTop = new Swiper(".swiper-product-top", {
		spaceBetween: 10,
		navigation: {
			nextEl: ".product-detail-button-next",
			prevEl: ".product-detail-button-prev"
		},
		thumbs: {
			swiper: galleryThumbs
		},
		on: {
			init: function() {
				galleryThumbs.update();
			}
		}
	});
	// Project detial swiper
	var projectSwiper = new Swiper(".swiper-project-detail .swiper-container", {
		slidesPerView: 1,
		autoplay: {
			delay: 2500
		},
		navigation: {
			nextEl: ".swiper-project-detail-next",
			prevEl: ".swiper-project-detail-prev"
		},
		speed: 1500
	});

	var productSlide = new Swiper(".product-slide .swiper-container", {
		slidesPerView: 5,
		spaceBetween: 10,
		breakpoints: {
			1025: {
				slidesPerView: 3
			},
			768: {
				slidesPerView: 2
			}
		},
		navigation: {
			nextEl: ".product-slide .swiper-next",
			prevEl: ".product-slide .swiper-prev"
		}
	});
	if (
		$("body").hasClass("product-detail-page") ||
		$("body").hasClass("homepage")
	) {
		var sliderPerView = 5;
	} else {
		var sliderPerView = 4;
	}

	var viewedProduct = new Swiper(".viewed-product .swiper-container", {
		slidesPerView: 4,
		spaceBetween: 10,
		breakpoints: {
			768: {
				slidesPerView: 2,
				spaceBetween: 10,
			},
			1025: {
				slidesPerView: 3,
				spaceBetween: 10,
			}
			
		},
		navigation: {
			nextEl: ".viewed-product .swiper-next",
			prevEl: ".viewed-product .swiper-prev"
		},
		// on: {
		// 	init: function() {
		// 		$(window).trigger("resize");
		// 	}
		// }
	});

	var flashSale = new Swiper(".flash-sale .swiper-container", {
		slidesPerView: sliderPerView,
		spaceBetween: 10,
		navigation: {
			nextEl: ".flash-sale .swiper-next",
			prevEl: ".flash-sale .swiper-prev"
		},
		breakpoints: {
			1025: {
				slidesPerView: 3
			},
			768: {
				slidesPerView: 2
			}
		},
		on: {
			init: function() {
				$(window).trigger("resize");
			}
		}
	});
}

//Filter active check mark
function checkMarrk() {
	$(".filter-check .form-check a").on("click", function() {
		$(this)
			.parents(".filter-check")
			.find(".form-check")
			.removeClass("active");
		$(this)
			.parents(".form-check")
			.toggleClass("active");
	});
}

function priceFilter(e) {
	let pageRoot = $(".urlwithoutprice").attr("href");
	let minprice = $(".min-input").val() || 0;
	let maxprice = $(".max-input").val() || 0;
	$.ajax({
		url: pageRoot,
		data: {
			isajax: true,
			price: minprice + "-" + maxprice
		},
		success: function(data) {
			pageRoot = $(data)
				.find(".urlwithprice")
				.attr("href");
			window.location.href = pageRoot;
		}
	});
}
