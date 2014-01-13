// def self.order_for_selects(project_id)
//     output = []
//     arr = ProductBreakdownStructure.where('project_id = ?', project_id)

//     root = arr.where('level = 0').first

//     output << root
//     output = output + self.get_childs(root.id, arr)
    
//     output
//   end

//   def self.get_childs(parent_id, nodes)
//     output = []
//     nodes.each do |node|
//       if node.parent == parent_id
//         output << node
//         output = output + self.get_childs(node.id, nodes)
//       end
//     end

//     output
//   end



jQuery(document).ready(function() {

  var data,
      depth = 0,
      arr = [],
      list  = jQuery('#org');
  step  = function(level, depth)
  {
      var array = [ ],
          items = level.children('li');
      items.each(function()
      {
          var li   = jQuery(this),
              item = jQuery.extend({}, { 'id': li.attr('id'), 'parent': li.parents('li').attr('id'), 'level': depth }),
              sub  = li.children('ul');
          if (sub.length) {
              step(sub, depth + 1);
          }
          arr.push(item);
      });
      return arr;
  };

  function saveWbsViaAjax() {
    jQuery.ajax({
      type: 'POST',
      data: { wbs: JSON.stringify(step(jQuery('#org'), depth)) },
      url: wbs_save_structure,
      success: function(data) {
        alert("ok");
        console.log(data);
      }
    });
    return false;
  }

  jQuery('#btn_wbs_save').click(function() {
    saveWbsViaAjax();
  });

});

function addWbsElement() {
  jQuery.ajax({
    type: 'POST',
    data: { id: jQuery('#elementId').val(), name: jQuery('#elementName').val() },
    url: wbs_add_element,
    dataType : 'json'
  }).done(function ( data ) {
    window.location.reload();
  }).fail(function ( data ) {
    alert('error');
  });
  return false;
}

function prepareModal(id) {
  jQuery('#elementId').val(id);

}