$(document).ready(function () {

	var speed = 500;
	$('#sidebar-index-wrappper > li.have-children > a').click(function (e) {
		e.preventDefault();
		if (!$(this).parent().hasClass('active')) {
			$('#sidebar-index-wrappper li ul').slideUp(speed);
			$(this).next().slideToggle(speed);
			$('#sidebar-index-wrappper li').removeClass('active');
			$(this).parent().addClass('active');
		} else {
			$(this).next().slideToggle(speed);
			$('#sidebar-index-wrappper li').removeClass('active');
		}
	});
	prodcutInputQuantityIncreament();
	swiperInit();
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


	var mySwiper = new Swiper('#index-news-swiper', {
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


	var indexSwiperCatalouge = new Swiper('#index-guide-swiper-catalogue', {
		direction: 'horizontal',
		slidesPerView: 1,
		loop: true,
		effect: 'fade',
		navigation: {
			nextEl: '.swiper-catelogue-next',
			prevEl: '.swiper-catelogue-prev',
		},
		autoplay: {
			delay: 500,
		},
		speed: 700,

	});
	// mySwiperPartner.autoplay.start();
	var mySwiperPartner = new Swiper('#index-news-partner-vertical', {
		direction: 'vertical',
		slidesPerView: 'auto',
		preventInteractionOnTransition: true,
		touchRatio: 0,
		loopAdditionalSlides: 4,
		loopedSlides: 4,
		autoplay: {
			delay: 500,
		},
		speed: 700,
		breakpointsInverse: true,
		breakpoints: {
			// when window width is >= 320px
			320: {
				slidesPerView: 2,
				spaceBetween: 20
			},
			// when window width is >= 480px
			1200: {
				slidesPerView: 'auto',
				loopAdditionalSlides: 4,
				spaceBetween: 0
			},
			// when window width is >= 640px
			1600: {
				slidesPerView: 'auto',
				spaceBetween: 0
			}
		}
	});

	var galleryThumbs = new Swiper('.swiper-product-thumbs', {
		spaceBetween: 20,
		loop: true,
		freeMode: false,
		slidesPerView: 4,

		loopedSlides: 5, //looped slides should be the same
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
	});
	var galleryTop = new Swiper('.swiper-product-top', {
		spaceBetween: 10,
		loop: true,
		loopedSlides: 5, //looped slides should be the same
		navigation: {
			nextEl: '.product-detail-button-next',
			prevEl: '.product-detail-button-prev',
		},
		thumbs: {
			swiper: galleryThumbs,
		},
	});
	// Project detial swiper
	var indexSwiperCatalouge = new Swiper('.swiper-project-detail', {
		direction: 'horizontal',
		slidesPerView: 1,
		loop: true,
		effect: 'fade',
		autoplay: {
			delay: 2500,
		},
		fadeEffect: {
			crossFade: true
		},
		navigation: {
			nextEl: '.swiper-project-deatil-next',
			prevEl: '.swiper-project-deatil-prev',
		},
		speed: 700,

	});

	//News autoplay swiper
	var indexSwiperCatalouge = new Swiper('.swiper-news', {
		direction: 'horizontal',
		slidesPerView: 1,
		loop: true,
		effect: 'fade',
		fadeEffect: {
			crossFade: true
		},
		autoplay: {
			delay: 2500,
		},
		speed: 700,

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