$(document).on('turbolinks:load', function() {
  $('.jscroll').jscroll({
  	contentSelector: '#my-videos .row',
  	nextSelector: 'a.next',
  	loadingHtml: 'loading...'
  });
});