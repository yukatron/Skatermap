$(document).on('turbolinks:load', function() {
  $('.jscroll').jscroll({
  	contentSelector: '.comments-content',
  	nextSelector: '.next',
  	loadingHtml: 'loading...'
  	padding: '20',
  	autoTrigger: true,
  });
});