'use strict';
/*global jQuery*/

// console.log shorthand. use cl() in place of console.log()
if (typeof console !== 'undefined' && typeof console.dir.bind !== 'undefined') {
	window.cl = console.dir.bind(console);
}

var ResponsiveBootstrapToolkit = ResponsiveBootstrapToolkit || {};

// comment out viewport, ResponsiveBootstrapToolkit variable to pass eslint while unused
//(function( $, viewport ){
(function($) {
	var $heroHomepage = $('.hero-homepage');
	if ($heroHomepage.length) {
		$('.close-hero').click(function() {
			$heroHomepage.siblings('.general').fadeIn(1000);
			$heroHomepage.siblings('.healthcare').hide();
		});

		$('.general-healthcare').click(function() {
			$heroHomepage.siblings('.healthcare').fadeIn(1000);
			$heroHomepage.siblings('.general').hide();
		});
	}

	var $heroProducts = $('.hero-product-solutions');
	if ($heroProducts.length) {
		$('.close-hero').click(function() {
			$heroProducts.siblings('.overview').show();
			$heroProducts.siblings('.server-rack, .video').hide();
		});

		$('.request').click(function() {
			$heroProducts.siblings('.server-rack').show();
			$heroProducts.siblings('.overview, .video').hide();
		});

		$('.btn-play-video').click(function() {
			console.log('play');
			$heroProducts.siblings('.video').show();
			$heroProducts.siblings('.overview, .server-rack').hide();
		});
	}


	var stickyElement = function() {
		// element to be sticky
		var $stickyEl = $('.navContain');
		// element that will stop the sticky element
		var $stopEl = $('.stop');

		var sticky = new Waypoint.Sticky({
			element: $stickyEl,
			wrapper: false,
			stuckClass: 'sticky',
			offset: 0
		});

		$stopEl.waypoint(function(direction) {
			if (direction == 'down') {
				// when scrolling down
				// replace pos:fixed with absolute and set top value to
				// the distance from $stopEl to viewport top minus the
				// height of the stickyElement
				var footerOffset = $stopEl.offset();
				$stickyEl.css({
					position: 'absolute',
					top: 0
						//top: footerOffset.top - $stickyEl.outerHeight()
				});
			} else if (direction == 'up') {
				// remove the inline styles so sticky styles apply again
				$stickyEl.attr('style', '');
			}

		}, {
			// trigger the waypoint when the bottom of stickyEl touches top of stopEl
			offset: function() {
				return $stickyEl.outerHeight();
			}
		});
	};

	stickyElement();

	var waypoint = new Waypoint({
		element: document.getElementById('overview'),
		handler: function(direction) {
			setActiveLi.call(this);
		}
	});

	var waypoint2 = new Waypoint({
		element: document.getElementById('features-benefits'),
		handler: function(direction) {
			setActiveLi.call(this);
		}
	});

	var waypoint3 = new Waypoint({
		element: document.getElementById('resources'),
		handler: function(direction) {
			setActiveLi.call(this);
		}
	});

	var waypoint4 = new Waypoint({
		element: document.getElementById('tech-specifications'),
		handler: function(direction) {
			setActiveLi.call(this);
		}
	});

	function setActiveLi() {
		var currentId = $(this.element).attr('id');
		$('.list-inline').find('li').removeClass('active');
		$('.list-inline').find('li.' + currentId).addClass('active');
	}

	var allMenus = $('.accordion-menu-container');
	var allContents = $('.accordion-content');

	$('.accordion-level').on('click', function() {
		var $currentMenu = $(this).find('.accordion-menu-container');
		var $currentContent = $(this).find('.accordion-content');

		if ($currentMenu.hasClass('open')) {
			$currentMenu.removeClass('open');
			$currentContent.removeClass('open');
			return false;
		}
		allMenus.removeClass('open');
		allContents.removeClass('open');
		$currentMenu.toggleClass('open');
		$currentContent.toggleClass('open');
		return false;
	});

	/**
	 * stickyNav scrolling functionality
	 */

	$('.stickyNav a').on('click', function(e){
		e.preventDefault();

		var el = $(this).attr('href').substring(1);

		$(window).scrollTo(document.getElementById(el), 1000);
	});

	/**
	 * Return to Top button funionality
	 */
	
	$('.cta-scroll-top').on('click', function() {
		$(window).scrollTo(0, 0, {
			duration: 1000
		});
	});

	$(window).scroll(function(){
		var $button = $('.cta-scroll-top'),
			scrollPos = $(window).scrollTop();

		if (scrollPos > 200 && !$button.hasClass('active')) {
			$button.addClass('active');
		} else if (scrollPos < 200 && $button.hasClass('active')) {
			$button.removeClass('active');
		}
	});


	//})( jQuery, ResponsiveBootstrapToolkit );
})(jQuery);
