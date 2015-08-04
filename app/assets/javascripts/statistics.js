jQuery(document).ready(function($) {
  fetchTodayResultsData();
}); //document.ready

function fetchTodayResultsData(){
  $.ajax({
    url: "http://localhost:3000/statistics/",
    dataType: "jsonp",
    type: "GET",
    processData: false,
    contentType: "application/json",
    success: function(data) {
      $('#' + id).
      append('<li>Remote id: ' + id + '</li>').
      append('<li>Reference: ' + data['product']['reference'] + '</li>').
      append('<li>Quantity: ' + data['product']['quantity'] + '</li>');
    }
  });
};