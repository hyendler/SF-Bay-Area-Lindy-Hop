$(document).ready(function () {
  bindListeners();
  // initMap();

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.601, lng: -122.205},
    // scrollwheel: false,
    zoom: 10

    // setUpAllMarkets();
  });
});

var bindListeners = function(){
  $("#main-box").on("click", ".list-box.day a", displayEvents)
  $("#main-box").on("click", "#week-link a", displayWeek)
}

var markers = [];

// var setUpAllMarkets = function(){
//   $.get("/events").done(function(response){

//   })
// }

var displayEvents = function(e){
  e.preventDefault();

  var url = $(this).attr("href")
  var day = url.substring(8).capitalize();

  $.get(url).done(function(response){
    var events = JSON.parse(response);
    setMarkers(events);
    $("#week").hide();

    var urlDay = createDayURL(day);
    $("#main-box").append(urlDay);

    var eventsHTML = createEventsHTML(events);
    $("#main-box").append(eventsHTML);
  })
}

String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

var setMarkers = function(events){
  events.forEach(function(event){
    var marker = new google.maps.Marker({
        position: {lat: event.lat, lng: event.lng},
        title: event.name,
        animation: google.maps.Animation.DROP,
        map: map
      });
    markers.push(marker);
  });
}

var createEventsHTML = function(events){
  var html = "<ul id=\"events\">";
  events.forEach(function(event){
    html += "<li class=\"list-box event\"><h4>" + event.name + "</h4><p>" + event.address + "</p><p>" + event.time + "</p></li>"
  })
  html += "</ul>"
  return html;
}

var createDayURL = function(day){
  var html = "<div id=\"week-link\"><a href=\"/days\"> << Back to week </a><h3>" + day + "</h3></div>";
  return html;
}

var displayWeek = function(e){
  e.preventDefault();
  var url = $(this).attr("href")
  console.log(url);
  $.get(url).done(function(response){
    $("#week-link").remove();
    $("#events").remove();
    removeMarkers();
    $("#week").show();
  })
}

var removeMarkers = function(){
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
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

