include("https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js");

$("#hide").click(function(){
  $("p").hide();
});

$("#show").click(function(){
  $("p").show();
});

$("#stop").click(function(){
  $("#panel").stop();
});
