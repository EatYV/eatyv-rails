// Generated by CoffeeScript 1.10.0
(function() {
  this.initMap = function() {
    var center, infowindow, map;
    center = {
      lat: 45.66,
      lng: 25.61
    };
    map = new google.maps.Map($('#map')[0], {
      zoom: 16,
      center: center,
      minZoom: 7,
      gestureHandling: 'greedy'
    });
    infowindow = new google.maps.InfoWindow;
    return $.getJSON('/recipes.json', function(jsonData) {
      return $.each(jsonData, function(key, data) {
        var latLng, marker;
        latLng = new google.maps.LatLng(data.lat, data.lng);
        marker = new google.maps.Marker({
          position: latLng,
          map: map,
          optimized: false,
          title: data.title,
          url: "/recipes/" + data.id
        });
        return google.maps.event.addListener(marker, 'click', function() {
          return window.location.href = this.url;
        });
      });
    });
  };

}).call(this);
