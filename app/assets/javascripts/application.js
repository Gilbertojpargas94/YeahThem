// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require best_in_place
//= require jquery.purr
//= require best_in_place.purr
//= require cocoon




function myFunction() {
    var x = document.getElementById("myDIV");
    var y = document.getElementById("myi");
    var z = document.getElementById("myii");
    var w = document.getElementById("see-more");


    if (x.style.display === "none") {
        x.style.display = "block";
        y.style.display = "block";
        z.style.display = "none";
        w.innerHTML = "Ocultar";
    } else {
        x.style.display = "none";
        y.style.display = "none";
        z.style.display = "block";
        w.innerHTML = "Ver más";
    }
} 
function showmore1(){
    var x = document.getElementById("more-results");
    var y = document.getElementById("down1");
    var z = document.getElementById("up1");
    var w = document.getElementById("show-more-results");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
        w.innerHTML = "Ocultar";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
        w.innerHTML = "Ver más";
    }
}

function showmore2(){
    var x = document.getElementById("more-happyclients");
    var y = document.getElementById("down2");
    var z = document.getElementById("up2");
    var w = document.getElementById("show-more-happyclients");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
        w.innerHTML = "Ocultar";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
        w.innerHTML = "Ver más";
    }
}
function bye(){
    var x = document.getElementById("content-results");
    var y = document.getElementById("down1");
    var z = document.getElementById("up1");
    var w = document.getElementById("see-moree");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
        w.innerHTML = "Ocultar";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
        w.innerHTML = "Ver más";
    }
}


function byebye2(iddown, idup, contedor){
    var x = document.getElementById("content-results2");
    var z = document.getElementById("up2");
    var y = document.getElementById("down2");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
    }
}
function byebye3(iddown, idup, contedor){
    var x = document.getElementById("content-results3");
    var z = document.getElementById("up3");
    var y = document.getElementById("down3");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
    }
}
function byebye4(iddown, idup, contedor){
    var x = document.getElementById("content-results4");
    var z = document.getElementById("up4");
    var y = document.getElementById("down4");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
    }
}
function byebye5(iddown, idup, contedor){
    var x = document.getElementById("content-results5");
    var z = document.getElementById("up5");
    var y = document.getElementById("down5");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
    }
}
function byebye6(iddown, idup, contedor){
    var x = document.getElementById("content-results6");
    var z = document.getElementById("up6");
    var y = document.getElementById("down6");


    if (x.style.display === "none") {
        x.style.display = "inline-block";
        y.style.display = "none";
        z.style.display = "inline";
    } else {
        x.style.display = "none";
        y.style.display = "inline";
        z.style.display = "none";
    }
}
/* for show the information or solution in company*/

function Information(){

    document.getElementById("option-informacion-company").style.fontWeight = "bold";
    document.getElementById("option-solution-company").style.fontWeight = "normal";

    var x = document.getElementById("show-information");
    var y = document.getElementById("show-solutions");

        x.style.display = "inline-block";
        y.style.display = "none";
}

function Solution(){

    document.getElementById("option-informacion-company").style.fontWeight = "normal";
    document.getElementById("option-solution-company").style.fontWeight = "bold";

    var x = document.getElementById("show-information");
    var y = document.getElementById("show-solutions");

        y.style.display = "inline-block";
        x.style.display = "none";
}

function scrollToPlus(target) {
    // For scroll to a id tag.
    var element = document.getElementById(target);
    element.scrollIntoView({behavior: "smooth", block: "start", inline: "center"});
}

$(document).on("turbolinks:load",function() {
  /* Activating Best In Place */
    jQuery(".best_in_place").best_in_place();
    $('.header-effect-show').hide();

    $(window).scroll(function () {
        if ($(window).scrollTop()>0) {
            $('.navbarthem').addClass('sticky');
        } else {
            $('.navbarthem').removeClass('sticky');
        }

        if ($(window).scrollTop()>250) {
            $(".content-header").addClass("content-header-sticky");
            $(".container-conts-header").css({ 'display':'flex'});
        } else {
            $(".content-header").removeClass("content-header-sticky");
            $(".container-conts-header").css({ 'display': 'none' });
        }

    /*
    content-header-sticky
    */
    });

    var lastScrollTop = 0;
    $(window).scroll(function (event) {
        var st = $(this).scrollTop();
        if (st > lastScrollTop) {
      } else {
            $(".navbarthem").removeClass("sticky");
            $(".content-header").removeClass("content-header-sticky");
            $(".container-conts-header").css({ 'display': 'none' });

        }
        lastScrollTop = st;
    });

    $('#back').on('click', () =>{
        $('#number_one').fadeIn().show();
        $('#number_second').fadeOut().hide();
    })


    /*code window info in edit pages*/

    $('input[name=nombre]').on('click', () =>{
        let contenttext="Nombre de la compañia";
 
        $('.details-windows').toggle( "fast", ()=>{
            $('.content-details').text(contenttext);
        });

        $('.details-windows').css({"display":"block","margin-top":"0px !important"});

        setTimeout( ()=>{
            $('.details-windows').toggle("fast");
        },3000);
    });

    /*---*/

        $('input[name=especializacion]').on('click', () =>{
        let contenttext="Especialización";
 
        $('.details-windows').toggle( "fast", ()=>{
            $('.content-details').text(contenttext);
        });

        $('.details-windows').css({"display":"block","margin-top":"0px !important"});

        setTimeout( ()=>{
            $('.details-windows').toggle("fast");
        },3000);
    });

    /*---*/

        $('input[name=frase]').on('click', () =>{
        let contenttext="Alguna Frase";
 
        $('.details-windows').toggle( "fast", ()=>{
            $('.content-details').text(contenttext);
        });


        $('.details-windows').css({"display":"block","margin-top":"320px !important"});

        setTimeout( ()=>{
            $('.details-windows').toggle("fast");
        },3000);
    });

    /*---*/

        $('.inputlinks').on('click', () =>{
        let contenttext="Redes soliales. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum doloribus iusto excepturi, neque illum ab. Aspernatur quidem, doloribus voluptatibus deserunt.";
 
        $('.details-windows').toggle( "fast", ()=>{
            $('.content-details').text(contenttext);
        });

        $('.details-windows').css({"display":"block","margin-top":"670px !important"});

        setTimeout( ()=>{
            $('.details-windows').toggle("fast");
        },3000);
    });

    
    
});




$(function(){
 var shrinkHeader = 130;
  $(window).scroll(function() {
    var scroll = getCurrentScroll();
    if($(window).width() > 960){
      if ( scroll >= shrinkHeader ) {
           $('.header').addClass('shrink');
           $('.homepage').hide();
           $('.speacil-link').hide();
           $('.header-effect-show').show();
        }
        else {
            $('.header').removeClass('shrink');
            $('.homepage').show();
            $('.speacil-link').show();
            $('.header-effect-show').hide();
        }
    }
  });
function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
    }
});

// Show a toast message
function toastMessage() {
    var x = document.getElementById("snackbar");
    x.className = "show";
    setTimeout(function(){ 
        x.className = x.className.replace("show", ""); 
    }, 3000);
}
