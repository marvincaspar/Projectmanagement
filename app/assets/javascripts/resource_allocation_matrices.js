function initRam() {
  jQuery('.show-wp').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    var wbs_id = jQuery(this).parents('.dd-list').parents('.dd-item').data('id');
    var show_url = wp_show_url.replace(':wbs_id', wbs_id).replace(':id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#ram_form').hide();
      fillInfo(data, jQuery('#wp_show'));
      jQuery('#wp_show').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });

  jQuery('.ram .glyphicon-pencil').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    var show_url = wp_edit_url.replace(':id', id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#wp_show').hide();
      fillForm(data, jQuery('#ram_form'));
      jQuery('#work_package_id').val(id);
      jQuery('#ram_form').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });
}