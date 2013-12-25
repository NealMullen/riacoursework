// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


if (history && history.pushState) {

  $(function() {

$(document).on("click",".pagination a", function() {

$.getScript(this.href);
history.pushState(null, document.title, this.href);
 return false;
 

});

    $("#posts_search").submit(function() {

     // $('html, body').animate({

       // scrollTop: $("#posts").offset().top
   // }, 640);
$("#intro").slideUp(300);
      $.get($("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script");
      history.pushState(null, document.title, $("#posts_search").attr("action") + "?" + $("#posts_search").serialize());
      
       return false;


    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });



  });

}

