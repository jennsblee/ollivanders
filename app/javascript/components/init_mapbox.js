import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2000 });
  };


  const addMarkersToMap = (map, markers) => {
    const mapMarkers = []

    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundRepeat = "repeat-y";
    element.style.width = '100px';
    element.style.height = '100px';

    const newMarker = new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    mapMarkers.push(newMarker)
    // We use the "getElement" funtion provided by mapbox-gl to access to the marker's HTML an set an id
    newMarker.getElement().dataset.markerId = marker.id;
    // Put a microphone on the new marker listening for a mouseenter event
    newMarker.getElement().addEventListener('mouseenter', (e) => toggleCardHighlighting(e) );
    // We put a microphone on listening for a mouseleave event
    newMarker.getElement().addEventListener('mouseleave', (e) => toggleCardHighlighting(e) );
    });

    const openInfoWindow = (mapMarkers) => {
    // Select all cards
    const cards = document.querySelectorAll('.index-card');
    cards.forEach((card, index) => {
      // Put a microphone on each card listening for a mouseenter event
      card.addEventListener('mouseenter', () => {
        // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
        mapMarkers[index].togglePopup();
      });
      // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
      card.addEventListener('mouseleave', () => {
        mapMarkers[index].togglePopup();
      });
    });
    }
  }

  const toggleCardHighlighting = (event) => {
  // We select the card corresponding to the marker's id
  const card = document.querySelector(`[data-flat-id="${event.currentTarget.dataset.markerId}"]`);
  // Then we toggle the class "highlight github" to the card
  card.classList.toggle('highlight');
  }

  if (mapElement) { // only build a map if there's a div#map to inject into
    // Generate map on page

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/ollivanders/ckhw2ak630y7719r1a99h423t'
    });

    const markers = JSON.parse(mapElement.dataset.markers);


    // Add markers to page
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);



    // Adding fancy little search bar
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));
  }
};

export { initMapbox };
