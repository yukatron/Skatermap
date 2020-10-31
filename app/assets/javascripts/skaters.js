$("document").ready(function() {

	$('#tab-contents .tab[id != "profile"]').hide();

	$('#tab-menu a').on('click', function() {
	  $("#tab-contents .tab").hide();
	  $("#tab-menu .active").removeClass("active");
	  $(this).addClass("active");
	  $($(this).attr("href")).show();
	  return false;
	});

});