//= require jquery
//= require jquery_ujs
//= require jquery.modal
//= require_tree .



 $(function() {

  
    $(document).tooltip({
      items: '.tooltip '   ,
      position: {
        my: "center bottom-20",
        at: "center top",
        using: function( position, feedback ) {
          $( this ).css( position );
          $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
        }
      }
    });
  });

$(function() {
   $.widget( "custom.catcomplete", $.ui.autocomplete, {
    _renderMenu: function( ul, items ) {
      var that = this,
        currentCategory = "";
      $.each( items, function( index, item ) {
        if ( item.category != currentCategory ) {
          ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
          currentCategory = item.category;
        }
        that._renderItemData( ul, item );
      });
    }
  });
   
    var data = [
      { label: "Electronics", category: "Categories" },
      { label: "Books", category: "Categories" },
      { label: "Misc", category: "Categories" },

      { label: "Test search term", category: "Popular Search Terms" },
      { label: "iPhone", category: "Popular Search Terms" },
      { label: "headphones", category: "Popular Search Terms" },

    ];
 
    $( "#search" ).catcomplete({
      delay: 0,
      source: data,
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
    $("html, body").animate({ scrollTop: 0 });
    //window.scrollTo(0, 0);
    return false;
  });
  $(document).on("click","a.ajax-this-bitch", function() {
    $.getScript(this.href);
    history.pushState(null, document.title, this.href);
    return false;
  });


  $("#posts_search").submit(function() {
    $("#posts").html('<img src="http://www.learnalanguage.com/courses/core/img/loading.gif.pagespeed.ce.VR3_8ncS6r.gif" style="display: block;margin-left: auto;margin-right: auto;"/>');
  setTimeout(function() {
    
    $("#intro").slideUp(300);
    $('input').blur();
    $.get($("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script");
    history.pushState(null, document.title, $("#posts_search").attr("action") + "?" + $("#posts_search").serialize());
  }, 360);
    return false;

  });
  $(window).bind("popstate", function() {
    $.getScript(location.href);
  });
});
}

