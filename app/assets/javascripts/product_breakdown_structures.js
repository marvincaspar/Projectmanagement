function initPbs() {
  jQuery('.pbs .glyphicon-eye-open').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    var show_url = pbs_show_url.replace(':id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#pbs_form').hide();
      fillInfo(data, jQuery('#pbs_show'));
      jQuery('#pbs_show').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });

  jQuery('.pbs .glyphicon-plus-sign, .show_form').click(function() {
    jQuery('#pbs_show').hide();
    var id = jQuery(this).parents('.dd-item').data('id');
    jQuery('.pbs #parent').val(id);
    jQuery('#pbs_form').show();
  });

  jQuery('.pbs .glyphicon-pencil').click(function() {
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