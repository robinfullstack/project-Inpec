/**
 * Provides a start point to run plugins and other scripts
 */
!(function($, window, document){

  $(function() {

    // Init Fast click for mobiles
    FastClick.attach(document.body);

    // inhibits null links
    $('a[href="#"]').each(function(){
      this.href = 'javascript:void(0);';
    });

    // popover init
    $("[data-toggle=popover]")
      .popover();

    // Bootstrap slider
    $('.slider').slider();

    // Chosen
    $(".chosen-select").chosen();

    // Filestyle
    $(".filestyle").filestyle();


  });

})(jQuery, this, document);
