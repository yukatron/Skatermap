let map
let geocoder

function initMap(){
  geocoder = new google.maps.Geocoder()

  inputAddress = document.getElementById('address').value;

  // geocodingしたあとmapを移動
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      let lat = results[0].geometry.location.lat();
      let lng = results[0].geometry.location.lng();
      let mark = {
        lat: lat,
        lng: lng
      };

      map.setCenter(results[0].geometry.location);
      let marker = new google.maps.Marker ({
        map: map,
        position: results[0].geometry.location
      });
    } else {
      alert('該当する結果がありませんでした');
    }
  });
}