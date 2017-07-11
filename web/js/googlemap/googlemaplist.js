var afpa;
var geolocalisation;
var styledMapType;

function initMap() {

    styledMapType = new google.maps.StyledMapType(
        [{"featureType":"landscape","stylers":[{"hue":"#FFA800"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#53FF00"},{"saturation":-73},{"lightness":40},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#FBFF00"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#00FFFD"},{"saturation":0},{"lightness":30},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#00BFFF"},{"saturation":6},{"lightness":8},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#679714"},{"saturation":33.4},{"lightness":-25.4},{"gamma":1}]}],
        {name: 'Styled Map'});
        
    var geocoder1 = new google.maps.Geocoder();
    setCenter(geocoder1, '' + $("#city").val() + ', ' + $('#address').val() +' ,AFPA');

}
function setCenter(geocoder, address) {
    geocoder.geocode({
      'address': address
    }, function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                afpa = results[0].geometry.location;
                map = new google.maps.Map(document.getElementById('map'), {
                    center: afpa,
                    zoom: 16,
                    mapTypeControlOptions: {
                        mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain',
                        'styled_map']
                    }
                });
                var directionsService = new google.maps.DirectionsService;
                var directionsDisplay = new google.maps.DirectionsRenderer;
    
                map.mapTypes.set('styled_map', styledMapType);
                map.setMapTypeId('styled_map');
                directionsDisplay = new google.maps.DirectionsRenderer();
                directionsDisplay.setMap(map);

                var marker = new google.maps.Marker({
                    position: afpa,
                    map: map,
                    title: 'Votre centre AFPA'
                });
//                document.getElementById('appbundle_carpooling_startingPoint')
//                        .addEventListener('change', onChangeHandler);
                  $(".menudown").click(function (){
                      calculateAndDisplayRoute(directionsService, 
                        directionsDisplay, $(this).next().val());
                  })
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
       });
}
function calculateAndDisplayRoute(directionsService, directionsDisplay, val) {
    console.log(val);
    directionsService.route({
        origin: val,
        destination: afpa,
        travelMode: 'DRIVING',
        unitSystem: google.maps.UnitSystem.METRIC,
        provideRouteAlternatives: true
    }, function(response, status) {
        if (status === 'OK') {
            directionsDisplay.setDirections(response);
        } else {
            window.alert('Directions request failed due to ' + status);
        }
    });
}
