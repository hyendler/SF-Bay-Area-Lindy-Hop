$(document).ready(function () {
  // initMap();
  bindListeners();
});

var bindListeners = function(){
  $("#main-box").on("click", ".list-box.day a", displayEvents)
}

var displayEvents = function(e){
  e.preventDefault();
  console.log("i'm here!")
  var url = $(this).attr("href")
  $.get(url).done(function(response){
    console.log(response)
  })
}

var initMap = function(){

    var myLatlng = new google.maps.LatLng(37.785,-122.440);
      var mapOptions = {
        zoom: 11,
        center: {lat: 37.601, lng: -122.205}
      }
      var map = new google.maps.Map(document.getElementById("map"), mapOptions);

      // var marker;
      // var markers = new Array();

      // for (var i = 0; i < locations.length; i++) {
      //   new google.maps.Marker({
      //     position: locations[i].coordinates,
      //     title: locations[i].name,
      //     map: map
      //   });

      //   markers.push(marker);
      // }

      // To add the marker to the map, call setMap();
      // marker.setMap(map);
  }

// var locations = [
//       {name: "9:20 Special",
//       address: "2460 Sutter St, San Francisco, CA 94115",
//       day: "Thursday",
//       coordinates: {lat: 37.785, lng: -122.440}},
//       {name: "Wednesday Night Hop",
//       address: "First United Methodist Church of Palo Alto, 625 Hamilton Ave, Palo Alto, CA 94301",
//       day: "Wednesday",
//       coordinates: {lat: 37.449, lng: -122.156}},
//       {name: "Cat's Corner",
//       address: "2565 Mission St, San Francisco, CA 94110",
//       day: "Wednesday",
//       coordinates: {lat: 37.756, lng: -122.418}},
//       {name: "For Dancers Only",
//       address: "550 E Remington Dr, Sunnyvale, CA 94087",
//       day: "Friday",
//       coordinates: {lat: 37.357, lng: -122.026}},
//       {name: "Le Jazz Hot at Mr. Tipples",
//       address: "39 Fell St, San Francisco, CA 94102",
//       day: "Monday",
//       coordinates: {lat: 37.776, lng: -122.418}},
//       {name: "Lindy in the Park",
//       address: "John F Kennedy Dr, San Francisco, CA 94118",
//       day: "Sunday",
//       coordinates: {lat: 37.772, lng: -122.467}},
//       {name: "Bal Haus",
//       address: "136 Missouri St, San Francisco, CA 94107, USA",
//       day: "Saturday",
//       coordinates: {lat: 37.764, lng: -122.397}},
//       {name: "Cosmo Alleycats at Local Edition",
//       address: "691 Market St, San Francisco, CA 94105",
//       day: "Tuesday",
//       coordinates: {lat: 37.787, lng: -122.403}}
//     ];

