// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require popper
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function updateTable(data, field) {
   $(".top-fish-body").empty();
   $.each(data.fish, function(index, fish) {
            $(".top-fish-body").append("<tr id='fish-" + (index + 1) + "'><th>" + (index + 1) + "</th><td>" + (field == "length" ? fish.length : fish.weight) + "</td><td>" + fish.species.name + "</td><td><a href=" + fish.angler.url + ">" + fish.angler.name + "</td></tr>")
  });
}




$(document).ready(function(){
  
  $("#add-fish-catch").click(function(){
    $("#fish-catch-form").show();
  });
  
  $(".cancel-form").click(function() {
    $("#fish-catch-form").hide();
  });
  
  $("input[type='file']").change(function(){
   $(".profile-image-upload-button").show();
   });  
  
  $(".top-fish").change(function() {
    var field = ($("#top-fish-sort-field").find(':selected').data('id'))
    var type = ($("#top-fish-species-field").find(':selected').data('id'))
    var user_id = window.location.pathname.split("/")[2]
    var data = {
      sortBy: field,
      limit: 10,
    }
    if (type) data.type = type 
    if (user_id) data.user_id = user_id
    
    
    $.ajax({
      url: "/fish_catches",
      type: "GET",
      data: data,
      success: function(data) {
        updateTable(data, field)
      }
    });
  });
  
});