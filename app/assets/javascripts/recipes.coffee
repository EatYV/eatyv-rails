# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@initMap = ->
  center = 
    lat: 43.78,
    lng: 24.62

  map = new (google.maps.Map) $('#map')[0],
    zoom: 7
    center: center
    minZoom: 7
    gestureHandling: 'greedy'
    
  infowindow = new (google.maps.InfoWindow)

    
  $.getJSON '/recipes.json', (jsonData) ->
    $.each jsonData, (key, data) ->
      latLng = new (google.maps.LatLng)(data.lat, data.lng)
      marker = new (google.maps.Marker)
        position: latLng
        map: map
        optimized: false
        title: data.title
        url: "/recipes/#{data.id}"
      google.maps.event.addListener marker, 'click', ->
        window.location.href = this.url;
