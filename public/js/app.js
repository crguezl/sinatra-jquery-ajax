$(document).ready(function() {
  $('#new_message').submit(function() {
    $.get('/cheer/'+$('#chazam').val(), '', function(data){
        $('#message').append("<p>" + data + "</p>");
        //$('#new_message').each(function(){this.reset();});
      }, "text");
    return false;
  });
});


