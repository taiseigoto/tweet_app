$(window).on('scroll', function() {
	scrollHeight = $(document).height();
	scrollPosition = $(window).height() + $(window).scrollTop();
	if ( (scrollHeight - scrollPosition) / scrollHeight <= 2.0) {
				$('.main-content__content-center').jscroll({
					contentSelector: '.main-content__content-center',
					nextSelector: 'span.next:last a',
					loadingHtml: '<div class="loader">Loading...</div>'
				});
			}
	});