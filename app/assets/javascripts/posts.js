$(document).on('turbolinks:load', function() {
  if ($("nav.pagination a[rel=next]").length){
    $("#videos").infiniteScroll({
      path: "nav.pagination a[rel=next]",
      append: ".video-box",
      history: false,
      prefill: false,
      status: ".page-load-status",
      hideNav: ".pagination"
    });
  };

  $fileField = $('#upload-video')

  $($fileField).on('change', $fileField, function(e) {

      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $(".video-preview");

      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<video>').attr({
            src: e.target.result,
            width: "45%",
            height: "110px",
            class: "preview-image",
            autoplay: "autoplay",
            loop: "loop",
            playsinline: "true",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    });
});