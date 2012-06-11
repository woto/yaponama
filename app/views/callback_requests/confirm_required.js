$(function() {
  return $("#callback_request").bind("ajax:success", function(evt, data, status, xhr) {
    return $("#callback_request_block").html(" <%= escape_javascript(render("callback_requests/common_confirm_required")) %> ");
  });
});
