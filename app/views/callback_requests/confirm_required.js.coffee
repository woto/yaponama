$ ->
  $("#callback_request").bind "ajax:success", (evt, data, status, xhr) ->
    $("#callback_request_block").html(" <%= escape_javascript(render("callback_requests/common_confirm_required")) %> ")
