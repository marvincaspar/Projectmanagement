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
    alert('MUSS NOCH GEMACHT WERDEN!!!');
    return false;

    var id = jQuery(this).parents('.dd-item').data('id');
    var show_url = pbs_edit_url.replace(':id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#pbs_show').hide();
      fillForm(data, jQuery('#pbs_form'));
      // jQuery('#work_package_id').val(id);
      jQuery('#pbs_form').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });
}