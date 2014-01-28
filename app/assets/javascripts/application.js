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
//= require jquery.ui.datepicker
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
  })
  .nestable('collapseAll')
  .on('change', updateOrder);

  jQuery('.dd-content .glyphicon-eye-open, .dd-content .glyphicon-plus-sign').click(function(){
    var element = jQuery(this).parents('.dd-content');

    jQuery('.dd-content').removeClass('active');
    element.addClass('active');
  });

  jQuery("#overlay").css({
    opacity : 0.5,
    top     : 0,
    bottom  : 0,
    left    : 0,
    right   : 0,
  });

  var maxheight = 0;
  jQuery("div.thumbnail").each(function(){
    if(jQuery(this).height() > maxheight) { maxheight = jQuery(this).height(); }
  });
   
  jQuery("div.thumbnail").height(maxheight + 43);

  jQuery('.glyphicon').each(function() {
    var tooltip = '';
    if(jQuery(this).hasClass('glyphicon-eye-open')) {
      tooltip = 'Anzeigen';
    } 
    else if(jQuery(this).hasClass('glyphicon-trash')) {
      tooltip = 'Löschen';
    }
    else if(jQuery(this).hasClass('glyphicon-pencil')) {
      tooltip = 'Bearbeiten';
    }
    else if(jQuery(this).hasClass('glyphicon-plus-sign')) {
      tooltip = 'Neu';
    }
    else if(jQuery(this).hasClass('glyphicon-time')) {
      tooltip = 'Aufwand';
    }
    jQuery(this).data('toggle', 'tooltip').attr('title', tooltip);
  });

  jQuery('.glyphicon').tooltip();

  initProject();
  initPbs();
  initWbs();
  initRbs();
  initRam();
  initMilestone();
  initIteration();
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

function clearForm(htmlObject) {
  htmlObject.find('select').val('');
  htmlObject.find('input[type!="submit"]').val('');
  htmlObject.find('textarea').val('');
}

var updateOrder = function(e)
{
    var list   = e.length ? e : $(e.target);

    jQuery("#overlay").fadeIn();
    jQuery.ajax({
      type: 'POST',
      data: { structure: JSON.stringify(list.nestable('serialize')) },
      url: save_structure
    }).done(function ( data ) {
      jQuery("#overlay").fadeOut();
    }).fail(function ( data ) {
      alert('error');
      console.log(data);
    });
};

function showNotice(message, status, fadeOutValue) {
  var fadeOutValue = 3000;

  var notice_div = jQuery("<div class='alert alert-" + status + " alert-dismissable'><button type='button' class='close' data-dismiss='alert'>×</button>" + message + "</div>");

  jQuery("#notice_div").append(notice_div);

  notice_div.animate({
    opacity : '+=0'
  }, 3000).fadeOut(fadeOutValue);
}
