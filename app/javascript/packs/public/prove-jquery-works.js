/* global console */
/* global document */

$(document).on("turbolinks:load", function() {
  "use strict";

  $("#prove-jquery-works").on("click", function(){
    console.log("Yaaayyy!!!!"); // eslint-disable-line no-console
  });

  $(".add-additional-glaze").on("click", function(e){
    e.preventDefault();
    $(".layer-glaze").last().clone().appendTo("#recipe-layers");
  });
});
