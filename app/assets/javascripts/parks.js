$(function() {
    $ initMap(){

    let test = {lat: <%= @park.latitude %>, lng: <%= @park.longitude %>};
    let map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: test
    });
}