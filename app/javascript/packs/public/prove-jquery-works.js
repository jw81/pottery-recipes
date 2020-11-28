/* global console */
/* global document */

function lazyLoadRecipeLayers() {
  var path = $(".lazy-load").data("path");
  $.ajax({
    type: "GET",
    url: path,
    complete: function(data) {
      if (data.status == 200) {
        $(".lazy-load").html(data.responseText);
      } else {
        console.log("SHIT!!!");
      }
    }
  });
}

function registerMyModalSubmissionEvent() {
  $("#my-submit-btn").on("click", function(e) {
    e.preventDefault();
    var form = $("#add-layer-form");
    var url = form.attr("action");

    $.ajax({
      type: "POST",
      url: url,
      data: form.serialize(),
      complete: function(data) {
        if (data.status == 200) {
          $("#add-layer-modal").modal("toggle");
          lazyLoadRecipeLayers();
        } else {
          console.log("SHIT!!!");
        }
      }
    });
  });
}

$(document).on("turbolinks:load", function() {
  "use strict";

  $("#prove-jquery-works").on("click", function(){
    console.log("Yaaayyy!!!!"); // eslint-disable-line no-console
  });

  lazyLoadRecipeLayers();
  registerMyModalSubmissionEvent();
});
