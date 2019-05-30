$(document).ready(function () {

	var speed = 500;
	$('.have-children a').each(function () {
		$(this).click(function (e) {
			e.stopPropagation()
			$(this).siblings('ul').slideToggle()
		})
	});
	prodcutInputQuantityIncreament();
	swiperInit();
	checkMarrk();
	$('.sidebar-toggle').click(function () {
		$('.sidebar-index-wrappper').slideToggle()
	})
	$(".social-network").jsSocials({
		shares: [{
				share: "facebook",
				label: "Share on Facebook"
			},
			{
				share: "twitter",
				label: "Tweet it"
			},
			{
				share: "pinterest",
				label: ""
			},
			{
				share: "email",
				label: "",
				logo: "fa fa-envelope-open"
			}
		]
	});
	$('.filter-title').each(function () {
		$(this).click(function () {
			$(this).next().slideToggle()
			$(this).toggleClass('active')
		})
	})
});



function swiperInit() {
	var mySwiper = new Swiper('#index-swiper', {
		direction: 'horizontal',
		slidesPerView: 1,
		loop: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});


	var mySwiper2 = new Swiper('.index-news-swiper .swiper-container', {
		direction: 'horizontal',
		slidesPerView: 1,
		loop: true,
		effect: 'fade',
		fadeEffect: {
			crossFade: true
		},
		navigation: {
			nextEl: '.index-news-swiper-prev',
			prevEl: '.index-news-swiper-next',
		},
	});


	var indexSwiperCatalouge = new Swiper('.index-guide-swiper-wrapper .swiper-container', {
		direction: 'horizontal',
		slidesPerView: 1,
		loop: true,
		navigation: {
			nextEl: '.swiper-catelogue-next',
			prevEl: '.swiper-catelogue-prev',
		},
		autoplay: {
			delay: 500,
		},
		speed: 700,
		breakpoints: {
			768: {
				slidesPerView: 3
			}
		}

	});
	// mySwiperPartner.autoplay.start();
	var swiperPartner = new Swiper('.index-news-partner .swiper-container', {
		direction: 'vertical',
		slidesPerView: 4,
		autoplay: {
			delay: 1500,
		},
		speed: 700,
		loop: true,
		breakpoints: {
			1025: {
				direction: 'horizontal',
				spaceBetween: 10
			},
			576: {
				direction: 'horizontal',
				spaceBetween: 10,
				slidesPerView: 2
			}
		}
	});

	var galleryThumbs = new Swiper('.swiper-product-thumbs', {
		spaceBetween: 20,
		freeMode: true,
		slidesPerView: 4,
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
		breakpoints: {
			768: {
				slidesPerView: 3
			}
		}
	});
	var galleryTop = new Swiper('.swiper-product-top', {
		spaceBetween: 10,
		navigation: {
			nextEl: '.product-detail-button-next',
			prevEl: '.product-detail-button-prev',
		},
		thumbs: {
			swiper: galleryThumbs,
		},
	});
	// Project detial swiper
	var projectSwiper = new Swiper('.swiper-project-detail .swiper-container', {
		slidesPerView: 1,
		autoplay: {
			delay: 2500
		},
		navigation: {
			nextEl: '.swiper-project-detail-next',
			prevEl: '.swiper-project-detail-prev',
		},
		speed: 1500
	});
}


function prodcutInputQuantityIncreament() {
	$('.btn-number').click(function (e) {
		e.preventDefault();

		let fieldName = $(this).attr('data-field');
		let type = $(this).attr('data-type');
		var input = $("input[name='" + fieldName + "']");
		var currentVal = parseInt(input.val());
		if (!isNaN(currentVal)) {
			if (type == 'minus') {
				if (currentVal > input.attr('min')) {
					input.val(currentVal - 1).change();
				}
				if (parseInt(input.val()) == input.attr('min')) {
					$(this).attr('disabled', true);
				}
			} else if (type == 'plus') {

				if (currentVal < input.attr('max')) {
					input.val(currentVal + 1).change();
				}
				if (parseInt(input.val()) == input.attr('max')) {
					$(this).attr('disabled', true);
				}
			}
		} else {
			input.val(0);
		}
	});

	$('.product-details-quantity').change(function () {
		let minValue = parseInt($(this).attr('min'));
		let maxValue = parseInt($(this).attr('max'));
		let valueCurrent = parseInt($(this).val());

		let name = $(this).attr('name');
		if (valueCurrent >= minValue) {
			$(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
		} else {
			$(this).val($(this).data('oldValue'));
		}
		if (valueCurrent <= maxValue) {
			$(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
		} else {
			$(this).val($(this).data('oldValue'));
		}

	});
}
//Filter active check mark
function checkMarrk() {
	$('.filter-check .form-check a').on("click", function () {
        $(this).parents('.filter-check').find('.form-check').removeClass('active');
		$(this).parents('.form-check').toggleClass('active');
})}