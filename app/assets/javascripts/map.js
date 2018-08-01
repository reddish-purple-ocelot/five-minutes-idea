
var url = 'http://localhost:3000/places.json';
var params = {
	method: 'GET',
	mode: 'cors',
	cache: 'default'
};
fetch(url, params).then( resp => resp.json() ).then( places =>  initMap(places));


function initMap(places) {
  var uluru = {lat: 50.451699, lng: 30.552512};

	var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: uluru,    mapTypeId: 'terrain'
    // mapTypeId: "roadmap"
  });

	places.reduce((markers, place) => {

			var marker = new google.maps.Marker({
				position: {lat: place.latitude, lng: place.longitude},
				map: map,
				title: place.name
			});

			var infowindow = new google.maps.InfoWindow();

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.setContent('<div><strong><h4>' + place.name + '</h4></strong><br>' +
                'Place ID: ' + place.id + '<br>' +
                place.address + '</div>');
			  infowindow.open(map, marker);
			});

			marker.addListener('position_changed', function() {
				map.setZoom(12);
				});

			marker.addListener('click', function() {
          map.setZoom(14);
          map.setCenter(marker.getPosition());
        });
	}, {});


  // var script = document.createElement('script');
  // script.src = 'http://localhost:3000/places.json';
  // document.getElementsByTagName('head')[0].appendChild(script);


// window.eqfeed_callback = function(results) {
//   for (var i = 0; i < results.length; i++) {
//     var coords1 = results[i].latitude;
//     var coords2 = results[i].longitude;

//     var latLng = new google.maps.LatLng(coords1,coords2);
//     var marker = new google.maps.Marker({
//       position: latLng,
//       map: map
//     });
//   }
// };
}
