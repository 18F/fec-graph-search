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
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


$(function () {
  $('.autofiller').click(function (e) {
    e.preventDefault();
    $('#graph-query').val($(this).data('autofill'));
    $('.graph-search form').submit();
    return false;
  });

  $('.ajax').click( function (e) {
    e.preventDefault();
    href = $(this).attr('href');
    $elm = $(this)
    $.ajax({
      url: href,
      dataType: 'json'
    }).done(function(data) {
      // $(this).html(data);
      // console.log(data)
      // console.log($elm.parent());
      // $elm.parent().html(data);
      for (var i = 0; i < data.length; i++) {
        var href = data[i]['end'];
        var node = href.substr(href.lastIndexOf('/') + 1);
        var str = "<a href='/nodes/"+node+"'>"+data[i]['type']+"</a>";
        $elm.replaceWith(str);
        console.log(data[i]);
      }
    });
    return false;
  });


  $( window ).resize(function() {
    fitElements(  
        '.full-width input[type=text]',
        '.full-width button'
      );
  });

  fitElements(  
      '.full-width input[type=text]',
      '.full-width button'
    );

});


function fitElements(elm1, elm2) {
  $elm1 = $(elm1);
  $elm2 = $(elm2);
  total = $elm1.parent().width() + $elm2.width();
  total = total - $elm2.width() - 100;

  $elm1.width(total);
}

