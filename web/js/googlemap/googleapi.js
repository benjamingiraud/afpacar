function initMap() {
    var styledMapType = new google.maps.StyledMapType(
            [{"featureType":"landscape","stylers":[{"hue":"#FFA800"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#53FF00"},{"saturation":-73},{"lightness":40},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#FBFF00"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#00FFFD"},{"saturation":0},{"lightness":30},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#00BFFF"},{"saturation":6},{"lightness":8},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#679714"},{"saturation":33.4},{"lightness":-25.4},{"gamma":1}]}],
            {name: 'Styled Map'});

        // Create a map object, and include the MapTypeId to add
        // to the map type control.
        var geocoder1 = new google.maps.Geocoder();
        setCenter(geocoder1, 'Morlaix, AFPA');

        //Associate the styled map with the MapTypeId and set it to display.
        
        function setCenter(geocoder, address) {
            geocoder.geocode({
              'address': address
            }, function(results, status) {
                    if (status === google.maps.GeocoderStatus.OK) {
                      var map = new google.maps.Map(document.getElementById('map'), {
                        center: results[0].geometry.location,
                        zoom: 16,
                        mapTypeControlOptions: {
                            mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain',
                            'styled_map']
                        }
                      });
                      map.mapTypes.set('styled_map', styledMapType);
                      map.setMapTypeId('styled_map');
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                        // return null;
                    }
                });
        }
google.maps.event.addDomListener(window, "load", initMap);
}