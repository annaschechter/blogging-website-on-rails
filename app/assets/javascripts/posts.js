//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('page:load', function() {
  $('#delete').click(function(event) {
      if (!confirm("Are you sure you want to delete this post?")) return false;
  });

})