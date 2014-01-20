function initMilestone() {
  jQuery("#product_breakdown_structure_ids").select2({
    placeholder: "Select PBS",
    width: "100%"
  });

  jQuery('.show_form').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    jQuery('#milestone_form').show();
  });

  jQuery('#milestone .glyphicon-pencil').click(function() {
    var id = jQuery(this).parents('h4').data('id');
    var show_url = milestone_edit_url.replace(':id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      console.log(data);
      jQuery.each(data.product_breakdown_structures, function(key, value) {
        console.log(value.id);
        jQuery('#milestone_form').find("option[value='" + value.id + "']").attr("selected", true);
      });

      jQuery('#product_breakdown_structure_ids').trigger("change");

      fillForm(data, jQuery('#milestone_form'));
      // jQuery('#work_package_id').val(id);
      //jQuery('#milestone_form').find('#product_breakdown_structure_ids').val(product_breakdown_structure_ids);
      jQuery('#milestone_form').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });
}