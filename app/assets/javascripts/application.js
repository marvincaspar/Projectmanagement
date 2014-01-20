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
//= require select2
//= require_tree .


function ready() {
  jQuery( ".datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });

  jQuery('.dd').nestable({ 
    listNodeName: 'ul',
    maxDepth: 100,
  }).nestable('collapseAll');

  jQuery('.dd-content .glyphicon-eye-open, .dd-content .glyphicon-plus-sign').click(function(){
    var element = jQuery(this).parents('.dd-content');

    jQuery('.dd-content').removeClass('active');
    element.addClass('active');
  });

  initProject();
  initPbs();
  initWbs();
  initRbs();
  initRam();
  initMilestone();
}

jQuery(document).ready(ready)
jQuery(document).on('page:load', ready)

function fillInfo(jsonObject, htmlObject) {
  jQuery.each(jsonObject, function(key, value){
    console.log(key);
    htmlObject.find('.' + key).text(value);

    if(typeof value == 'object' && value != null) {
      jQuery.each(value, function (k, v){
        htmlObject.find('.' + key + '_' + k).text(v);
      });
    }
  });
}

function fillForm(jsonObject, htmlObject) {
  jQuery.each(jsonObject, function(key, value){
    setForm(htmlObject, key, value);

    if(typeof value == 'object' && value != null) {
      jQuery.each(value, function (k, v){
        setForm(htmlObject, key, value);
      });
    }
  });
}

function setForm(htmlObject, key, value) {
  htmlObject.find('select#' + key).val(value);
  htmlObject.find('input[id$="' + key + '"]').val(value);
  htmlObject.find('textarea[id$="' + key + '"]').val(value);
}

