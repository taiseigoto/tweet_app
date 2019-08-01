$(window).on 'scroll', ->
  scrollHeight = $(document).height()
  scrollPosition = $(window).height() + $(window).scrollTop()
  if (scrollHeight - scrollPosition) / scrollHeight <= 0.05
    $('.main-content__content-center').jscroll
      contentSelector: '.skill-list'
      nextSelector: 'span.next:last a'
    return
  return
