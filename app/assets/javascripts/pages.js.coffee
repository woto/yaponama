# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  if $("#page_path").length > 0
    $("#page_path").filter_input regex: "[a-zа-я0-9/-]"
