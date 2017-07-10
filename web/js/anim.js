$(document).ready(function() {
    $( ".js-datepicker" ).datepicker({
        dateFormat: "yy/mm/dd"
    });
    $( "#etablishments" ).selectmenu();
    $( "#user_region" ).selectmenu();
    $( "#appbundle_carpooling_type" ).selectmenu();
    $( ".menudown" ).click(function() {
        $(this).toggleClass("active");
        $(this).parent().parent().next().slideToggle("1500");
    });
    $( function() {
        $( ".dialog" ).dialog({
            autoOpen: false,
            dialogClass: "alert",
            draggable: false,
            resizable: false,
            create: function (event, ui) {
                $(".ui-dialog").css('border-bottom-left-radius','0px');
                $(".ui-dialog").css('border-top-left-radius','0px');
                $(".ui-dialog").css('border-top-right-radius','0px');
                $(".ui-dialog").css('border-bottom-right-radius','0px');
                $(".ui-dialog-titlebar").css('border-bottom-left-radius','0px');
                $(".ui-dialog-titlebar").css('border-top-left-radius','0px');
                $(".ui-dialog-titlebar").css('border-top-right-radius','0px');
                $(".ui-dialog-titlebar").css('border-bottom-right-radius','0px');
            },
            show: {
              effect: "shake",
              duration: 500
            },
            hide: {
              effect: "drop",
              duration: 500
            },
            open: function(event, ui) {
                $('#page-mask').fadeIn(100);
            },
            close: function(event, ui) {
                $('#page-mask').fadeOut(100);
            }
        });
        $( ".dialog" ).dialog( "open" );
    });
    $("#asks").click(function() {
        $("#offers").removeClass("selected");
        $(this).addClass("selected");
        $(".offers-container").slideUp("slow", function() {
            $(".ask-container").slideDown('slow');
        });
    });
    $("#offers").click(function() {
        $("#asks").removeClass("selected");
        $(this).addClass("selected");
        $(".ask-container").slideUp("dlow", function() {
            $(".offers-container").slideDown("slow");
        });
    });
    $('.keeplogged').click(function() {
        $("#checkbox1").prop("checked", !$("#checkbox1").prop("checked"));
    });
    
//    $( window ).resize(function() { $('#header').sticky('update'); });

    $(window).scroll(function () {
        if( $(window).scrollTop() > $('header').height()*(3/2)) {
            $("#afpacarlogo").animate({
                width: '50%'
            }, {
                duration: 100,
                queue: false
            });
            $(".header-container").animate({
                width: '95%'
            }, {
                duration: 500,
                queue: false
            });
        }
        else {
            $(".main-container").animate({
            marginTop: '1em'
        }, {
            duration: 1,
            queue: false
        });
        
        $("#afpacarlogo").animate({
            width: '100%'
        }, {
            duration: 100,
            queue: false
        });
        
        $(".header-container").animate({
            width: '90%'
        }, {
            duration: 500,
            queue: false
        });
        }
    });

});