(function($) {

	var $heroHomepage = $('.hero-homepage');
	if ($heroHomepage.length) {
		$('.close-hero').click(function() {
			$heroHomepage.siblings('.hero-homepage.general').fadeIn(1000);
			$heroHomepage.closest('.healthcare').hide();
		});

		$('.general-healthcare').click(function() {
			$(this).closest('.injectioncontainerwrapper .healthcare').fadeIn(1000);
			$heroHomepage.siblings('.hero-homepage.general').hide();
		});
	}

})(jQuery);