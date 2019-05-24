$(document).ready(function () {
	// Viết Script ở đây!
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
	var mySwiperPartner = new Swiper('#index-news-partner-vertical', {
		direction: 'vertical',
		centeredSlides: true,
		slidesPerView: 'auto',
		loopedSlides :'auto',
		autoplay: {
			delay: 500,
		},
		speed: 700,

	});
	var indexSwiperCatalouge = new Swiper('#index-guide-swiper-catalogue', {
		direction: 'horizontal',
		slidesPerView: 1,
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



}