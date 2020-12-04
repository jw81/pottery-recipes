/* global console */
/* global document */

function lazyLoadRecipeLayers() {
  var path = $("#layers.lazy-load").data("path");
  $.ajax({
    type: "GET",
    url: path,
    complete: function(data) {
      if (data.status == 200) {
        $("#layers.lazy-load").html(data.responseText);
      } else {
        console.log("SHIT!!!");
      }
    }
  });
}

function lazyLoadRecipeClay() {
  var path = $("#clay.lazy-load").data("path");
  $.ajax({
    type: "GET",
    url: path,
    complete: function(data) {
      if (data.status == 200) {
        $("#clay.lazy-load").html(data.responseText);
      } else {
        console.log("SHIT!!!");
      }
    }
  });
}

function registerMyModal1SubmissionEvent() {
  $("#my-submit1-btn").on("click", function(e) {
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

function registerMyModal2SubmissionEvent() {
  $("#my-submit2-btn").on("click", function(e) {
    e.preventDefault();
    var form = $("#select-clay-form");
    var url = form.attr("action");

    $.ajax({
      type: "POST",
      url: url,
      data: form.serialize(),
      complete: function(data) {
        if (data.status == 200) {
          $("#select-clay-modal").modal("toggle");
          lazyLoadRecipeClay();
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
  lazyLoadRecipeClay();
  registerMyModal1SubmissionEvent();
  registerMyModal2SubmissionEvent();
});
