$(function() {
  $('.pagination a').attr('data-remote', 'true')
  $('#company, #gender, #active').on('change', function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
});
