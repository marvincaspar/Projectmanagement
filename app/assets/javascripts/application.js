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
//= require bootstrap
//= require jquery.ui.all
//= require jquery-sortable
//= require jquery.jOrgChart
//= require jquery.nestable
//= require_tree .


function ready() {
  jQuery( ".datepicker" ).datepicker();

  jQuery('.dd').nestable({ 
    listNodeName: 'ul',
    maxDepth: 100,
  }).nestable('collapseAll');

  jQuery('.dd-content .glyphicon-eye-open, .dd-content .glyphicon-plus-sign').click(function(){
    var element = jQuery(this).parents('.dd-content');

    jQuery('.dd-content').removeClass('active');
    element.addClass('active');
  });

  initPbs();
  initWbs();
  initRbs();
}

jQuery(document).ready(ready)
jQuery(document).on('page:load', ready)

function fillForm(jsonObject, htmlObject) {
  jQuery.each(jsonObject, function(key, value){
    htmlObject.find('.' + key).text(value);

    if(typeof value == 'object' && value != null) {
      jQuery.each(value, function (k, v){
        htmlObject.find('.' + key + '_' + k).text(v);
      });
    }
  });
}