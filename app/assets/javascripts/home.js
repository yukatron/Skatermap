$(document).on('turbolinks:load',function () {
  $("#slide").skippr({
    transition : 'slide',
	speed : 2000,
	easing : 'easeOutQuart',
	navType : 'block',
	childrenElementType : 'div',
	arrows : true,
	autoPlay : true,
	autoPlayDuration : 5000,
	keyboardOnAlways : true,
	hidePrevious : false
  });
});