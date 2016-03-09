$(function (){

  $('.add_to_collection').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    var route = $('input.add_to_collection').parent().attr("action");
    var serial = $('input.add_to_collection').parent().serialize();
    var user = serial.user_id
    console.log(user)




    // $.ajax({
    //   method: 'POST',
    //   url: route,
    //   data:
    // })
  });

  $('.remove_from_collection').on('click', function(event){
    event.preventDefault();
    event.stopPropagation();
    var route = $('input.remove_from_collection').parent().attr("action");

    console.log(this)


  });

});
