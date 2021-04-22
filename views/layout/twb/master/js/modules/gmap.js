/**=========================================================
 * Module: gmap.js
 * Init Google Map plugin
 =========================================================*/

!(function($, window, document){
    
    var mapSelector = '[data-toggle="gmap"]';

    if($.fn.gMap) {
        
        var gMap = $(mapSelector).each(function(){
            
            var $this   = $(this),
              addresses = $this.data('address').split(';'),
              zoom      = $this.data('zoom') || 14
              markers   = [];

            for(var a in addresses)  {
                if(typeof addresses[a] == 'string')
                    markers.push({address : addresses[a], html: ''});
            }
              
            $this.gMap({
                maptype:     'ROADMAP',
                zoom:        zoom,
                markers:     markers,
                scrollwheel: false
            });

        }); //each
    }
    
    // Center Map marker on resolution change
    $(window).resize(function() {
        var mapRef, currMapCenter;
        if(gMap && gMap.length) {
            mapRef = gMap.data('gMap.reference');
            currMapCenter = mapRef.getCenter();
            if(mapRef && currMapCenter) {
                google.maps.event.trigger(mapRef, "resize");
                mapRef.setCenter(currMapCenter);
            }
        }
    });

})(jQuery, window, document);
