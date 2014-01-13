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
//= require_tree .


jQuery(document).ready(function() {
  jQuery( ".datepicker" ).datepicker();

  jQuery("ol.sortable").sortable();

  jQuery("#org").jOrgChart({
    chartElement : '#chart',
    dragAndDrop  : true
  });
});

function clickk(el){
  if($("#ol"+el).hasClass("hidden")){
    $("#ol"+el).removeClass("hidden");
    $("#img"+el).attr('src', $("#img"+el).attr('src').substring(0,$("#img"+el).attr('src').lastIndexOf("/")) + "/delete.png");
  }else{
    $("#ol"+el).addClass("hidden")
    $("#img"+el).attr('src', $("#img"+el).attr('src').substring(0,$("#img"+el).attr('src').lastIndexOf("/")) + "/add.png");
  }
  
}

function editDial(id, name){
  $("#dialcontent").html(""+
    "<input type='hidden'value='"+ id +"' id='dialid'/>" +
    "<h3>Name bearbeiten</h3><br/>" +
    "<hr/>"+
    "<input type='text' id='cpname' value='"+ name +"'/><br/>"+
    "<hr/>"+
    "<button class='button button-submit' action='saveChanges();'>Speichern</button>"+
    "<button class='button' action='closeDial();>Abbrechen</button>"
  );
  showDialog();
}

function addChildDial(id, name){
  $("#dialcontent").html(""+
    "<input type='hidden' value='"+ id +"' id='parentid'/>" +
    "<h3>Neuen Unterpunkt erstellen</h3><br/>" +
    "<hr/>"+
    "Oberpunkt: " + name + "<br/>" +
    "Name <input type='text' id='newcname'/><br/>"+
    "<hr/>"+
    "<button class='button button-submit' action='saveChild();'>Speichern</button>"+
    "<button class='button' action='closeDial();>Abbrechen</button>"
  );
  showDialog();
}

function deleteDial(id, name){
  $("#dialcontent").html(""+
    "<input type='hidden' value='"+ id +"' id='dialid'/>" +
    "<h3>Knoten <b>"+name+"</b> und alle Unterpunkte löschen?</h3><br/>" +
    "<hr/>"+
    "<button class='button button-submit' action='delete_pbs();'>Löschen</button>"+
    "<button class='button' action='closeDial();>Abbrechen</button>"
  );
  showDialog();
}

function saveChanges(){
  $.ajax({
    url: $("#dialactionpath").val()+$("#dialid").val(),
    dataType: "json",
    type: "post",
    processData: false,
    contentType: "application/json",
    beforeSend: function(xhr){
      xhr.setRequestHeader("X-Http-Method-Override","DELETE");
    },
    success: function(data){
      $("#name"+$("#dialid").val()).html($("#cpname").val());
      hideDialog();
    }
  });
  return false;
}

function saveChild(){
  $.ajax({
    url: $("#dialactionpath").val()+$("#dialid").val(),
    dataType: "json",
    type: "post",
    processData: false,
    contentType: "application/json",
    beforeSend: function(xhr){
      xhr.setRequestHeader("X-Http-Method-Override","DELETE");
    },
    success: function(data){
      id = $("#dialid").val();
      is = $("#img"+id).attr('src');
      cl = $("#ol"+id).children().length + 1;
      image_path = is.substring(0,is.lastIndexOf("/"))+"/";
      nid = id + "" + cl;
      nname = $("#newcname").val();
      $("#ol"+id).append(
        "<li class='list-group-item'>"+
          "<img   src='"+ image_path + "add.png" +"'/>"+
          "<span  class='sortable-list-number'      id='linr+"+ nid + "'>"+ $("#linr"+id).html() + "." + cl + "</span>"+
          "<span  class='sortable-list-name'        id='name" + nid + "'>"+ nname +"</span>"+
          "<div   class='sortable-list-icons pull-right'>"+
                "<img src='"+ image_path + 'application_add.png'  +"' onClick='addChildDial(" +nid+",'"+nname+"');'/>"+
                "<img src='"+ image_path + 'pencil.png'     +"' onClick='editDial("   +nid+",'"+nname+"');'/>"+
                "<img src='"+ image_path + 'bin.png'        +"' onClick='deleteDial(" +nid+",'"+nname+"');'/>"+
              "</div>"+
              "<ol  class='hidden' id='ol" + nid +"'> </ol>");
      clickk(id);
      hideDialog();
    }
  });
  return false;
}

function delete_pbs(){
  $.ajax({
    url: $("#dialactionpath").val()+$("#dialid").val(),
    dataType: "json",
    type: "post",
    processData: false,
    contentType: "application/json",
    beforeSend: function(xhr){
      xhr.setRequestHeader("X-Http-Method-Override","DELETE");
    },
    success: function(data){
      $("#ol"+$("#dialid").val()).parent().remove();
      hideDialog();
    }
  });
  return false;
}

function hideDialog(){
  $("#dialog").addClass("hidden");
  $("#dialcontent").html("");
}

function showDialog(){
  $("#dialog").removeClass("hidden");
}