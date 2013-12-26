//= require jquery
//= require jquery_ujs
//= require jquery.modal
//= require_tree .

$(function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#search" ).autocomplete({
      source: availableTags,
        select: function(event, ui) { 
        $("#search").val(ui.item.label);
        $("#posts_search").submit(); }
    });
  });

if (history && history.pushState) {
$(function() {
  $(document).on("click",".pagination a", function() {
    $.getScript(this.href);
    history.pushState(null, document.title, this.href);
    return false;
  });
  $(document).on("click","a#all-posts", function() {
    $.getScript(this.href);
    history.pushState(null, document.title, this.href);
    return false;
  });
  $(document).on("click","a.view-post", function() {
    $.getScript(this.href);
    history.pushState(null, document.title, this.href);
    return false;
  });


 $(document).on("click","a.back", function() {
    $.getScript(this.href);
    history.pushState(null, document.title, this.href);
    return false;
  });

  $("#posts_search").submit(function() {
    $("#intro").slideUp(300);
    $('input').blur();
    $.get($("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script");
    history.pushState(null, document.title, $("#posts_search").attr("action") + "?" + $("#posts_search").serialize());
    return false;
  });
  $(window).bind("popstate", function() {
    $.getScript(location.href);
  });
});
}

