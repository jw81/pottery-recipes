/* global console */
/* global document */

$(document).on("turbolinks:load", function() {
  "use strict";

  $("#prove-jquery-works").on("click", function(){
    console.log("Yaaayyy!!!!"); // eslint-disable-line no-console
  });

  $("#add-glaze").on("click", function(e){
    e.preventDefault();
    $(".recipe-glaze").last().clone().appendTo(".recipe-glazes-section");
  });
});
