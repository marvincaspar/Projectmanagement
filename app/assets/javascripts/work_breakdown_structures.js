function initWbs() {
  jQuery('.show-wbs').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    var show_url = wbs_show_url.replace(':wbs_id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#form').hide();
      jQuery('#wp_show').hide();
      fillForm(data, jQuery('#wbs_show'));
      jQuery('#wbs_show').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });

  jQuery('.show-wp').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    var wbs_id = jQuery(this).parents('.dd-list').parents('.dd-item').data('id');
    var show_url = wp_show_url.replace(':wbs_id', wbs_id).replace(':id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#form').hide();
      jQuery('#wbs_show').hide();
      fillForm(data, jQuery('#wp_show'));
      jQuery('#wp_show').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });

  jQuery('.wbs .glyphicon-plus-sign, .show_form').click(function() {
    jQuery('#wbs_show').hide();
    jQuery('#wp_show').hide();
    var id = jQuery(this).parents('.dd-item').data('id');
    jQuery('.wbs #parent').val(id);
    jQuery('.wp #work_breakdown_structure_id').val(id);
    jQuery('#form').show();
  });
}