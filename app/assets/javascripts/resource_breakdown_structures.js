function initRbs() {
  jQuery('.show-rbs').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    var show_url = rbs_show_url.replace(':rbs_id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#form').hide();
      jQuery('#r_show').hide();
      fillForm(data, jQuery('#rbs_show'));
      jQuery('#rbs_show').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });

  jQuery('.show-r').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    var rbs_id = jQuery(this).parents('.dd-list').parents('.dd-item').data('id');
    var show_url = r_show_url.replace(':rbs_id', rbs_id).replace(':id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#form').hide();
      jQuery('#rbs_show').hide();
      fillForm(data, jQuery('#r_show'));
      jQuery('#r_show').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });

  jQuery('.rbs .glyphicon-plus-sign, .show_form').click(function() {
    jQuery('#rbs_show').hide();
    jQuery('#r_show').hide();
    var id = jQuery(this).parents('.dd-item').data('id');
    jQuery('.rbs #parent').val(id);
    jQuery('.r #resource_breakdown_structure_id').val(id);
    jQuery('#form').show();
  });
}