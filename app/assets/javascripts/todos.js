$(function() {
  $('input[type=checkbox]').bind('change', function() {
    $.ajax({
      url: '/todos/'+this.value+'/check',
      type: 'POST',
      data: {"checked_flg": this.checked}
    });
  });
});
