$("document").ready(function() {
    $(".slide").skippr();
});

$(".slide").skippr({
	transition : 'slide',
	speed : 1000,
	easing : 'easeOutQuart',
	navType : 'block',
	childrenElementType : 'div',
	arrows : true,
	autoPlay : true,
	autoPlayDuration : 3000,
	keyboardOnAlways : true,
	hidePrevious : false
});
