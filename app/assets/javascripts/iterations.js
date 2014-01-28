function initIteration() {
  jQuery('.show-expert').click(function() {
    var work_package_id = jQuery(this).parents('.dd-item').data('id');
    var iteration_id = jQuery(this).parents('.dd-item').data('iteration');
    var show_url = expert_edit_url.replace(':iteration_id', iteration_id).replace(':id', 0);
    jQuery('#iteration_id').val(iteration_id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#wbs_show').hide();
      jQuery('#wp_show').hide();
      fillForm(data, jQuery('#form'));
      if(data.message == null){
        data.message = '';
      }
      jQuery('i.message').text(data.message);
      var form_url = jQuery('#new_estimation').attr('action');
      form_url = form_url.replace('iterations/1/', 'iterations/' + iteration_id + '/');
      jQuery('#new_estimation').attr('action', form_url);
      jQuery('#form').show();
    }).fail(function ( data ) {
      alert('error');
    });
    jQuery('#wbs_show').hide();
    jQuery('#wp_show').hide();
    jQuery('#form').show();
  });

  jQuery('.show-projectowner').click(function() {
    var work_package_id = jQuery(this).parents('.dd-item').data('id');
    var show_url = projectowner_show_url.replace('_work_package_id', work_package_id);

    jQuery.ajax({
      type: 'GET',
      url: show_url,
      dataType : 'json'
    }).done(function ( data ) {
      jQuery('#wbs_show').hide();
      jQuery('#wp_show').hide();
      createIterationList(data);
      jQuery('#work_package_id').val(work_package_id);
      jQuery('#form').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });

  function createIterationList(data) {
    jQuery('.form-projectowner').html('');
    var counter = 1;
    jQuery.each(data, function(key, value) {
      var avg = 0;
      jQuery('.form-projectowner').append('<h4>' + counter + '. Iteration</h4>');
      jQuery('.form-projectowner').append('<div class="list-group"></div>');
      if(!value.open) {
        jQuery('.form-projectowner .list-group:last-child').addClass('text-muted');
      }
      jQuery.each(value.estimations, function(k, v) {
        var comment = '';
        if(value.open) {
          jQuery('.comment-holder').load(comment_html_url, function( response, status, xhr ) {
            if(v.message == null){
              v.message = '';
            }
            comment = response.replace(/{:id}/g, v.id).replace('{:iteration_id}', value.id).replace('{:message}', v.message);
            setCommentBlock(v, comment);
          });
          console.log(comment);
        } else {
          setCommentBlock(v, '');
        }
        
        if(avg == 0) {
          avg = avg + v.effort
        } else {
          avg = (avg + v.effort) / 2;
        }
      });
      counter++;
      jQuery('.form-projectowner').append('Durchschnitt: ' + avg);
    });
  }

  function setCommentBlock(estimation, comment) {
    jQuery('.form-projectowner .list-group:last-child').append('<div class="list-group-item">' + estimation.user.email + ': ' + estimation.effort + comment + '</div>');
  }

  jQuery('.add-iteration').click(function() {
    var work_package_id = jQuery('#work_package_id').val();
    var show_url = create_iteration_url.replace('_work_package_id', work_package_id);

    jQuery.ajax({
      type: 'POST',
      url: show_url,
      dataType : 'json',
      data:  { iteration: { work_package_id: work_package_id } },
    }).done(function ( data ) {
      jQuery('#wbs_show').hide();
      jQuery('#wp_show').hide();
      createIterationList(data);
      jQuery('#form').show();
    }).fail(function ( data ) {
      alert('error');
    });
  });
}

  function save_comment(btn) {
    var iteration_id = jQuery(btn).parents('[id^="estimation_"]').data('iteration');
    var estimation_id = jQuery(btn).parents('[id^="estimation_"]').data('estimation');
    var message = jQuery(btn).parents('[id^="estimation_"]').find('.message').val();
    var show_url = expert_edit_url.replace(':iteration_id', iteration_id).replace(':id', estimation_id);

    jQuery.ajax({
      type: 'PUT',
      url: show_url,
      dataType : 'json',
      data:  { estimation: { message: message } },
    }).done(function ( data ) {
      jQuery('#wbs_show').hide();
      jQuery('#wp_show').hide();
      jQuery(btn).parents('[id^="estimation_"]').collapse('hide');
      jQuery('#form').show();
    }).fail(function ( data ) {
      alert('error');
    });
  }