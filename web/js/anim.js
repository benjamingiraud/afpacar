$( ".datepicker" ).datepicker({
  dateFormat: "yy/mm/dd"
});
$( document ).tooltip();
$( "#etablishments" ).selectmenu();
$( "#region" ).selectmenu();
$( ".menudown" ).click(function() {
    $(this).toggleClass("active");
    $(this).parent().parent().next().slideToggle("1500");
});