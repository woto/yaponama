# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->

  $.tablesorter.addParser
    id: "clipper"
    is: (s) ->
      false

    format: (s) ->
      a = parseInt(s, 10)
      if a >= 0 
        a
      else
        100000

    type: "numeric"


  $("table#result-prices").tablesorter(
    headers:
      3:
        sorter: "clipper"
      4:
        sorter: "clipper"
      5:
        sorter: "clipper"
      7:
        sorter: "clipper"
    widthFixed: true
  ).tablesorterPager 
    container: $("#pager")

  # Кнопки очистки полей ввода
  $("#clear-manufacturer").click ->
    $("#manufacturer").val('')

  $("#clear-catalog-number").click ->
    $("#catalog-number").val('')
