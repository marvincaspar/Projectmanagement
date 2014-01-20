function initMilestone() {
  jQuery("#product_breakdown_structure_ids").select2({
    placeholder: "Select PBS",
    width: "100%"
  });

  jQuery('.show_form').click(function() {
    var id = jQuery(this).parents('.dd-item').data('id');
    jQuery('#milestone_form').show();
  });
}