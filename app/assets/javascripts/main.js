$(function () {

Gmaps.map.listen_to_markers = function(markers){
  for(var i = 0; i < markers.length; i++){
    marker = markers[i];
    google.maps.event.addListener(marker.serviceObject, 'click', 
      (function(marker){
        return function(){ 
        $('#search_results').animate({ scrollLeft: $('#' + marker.id).offset().left }, 'slow');     
        }
      })(marker)
   )
 }
}

Gmaps.map.callback = function(){
  Gmaps.map.listen_to_markers(Gmaps.map.markers);
}
});
