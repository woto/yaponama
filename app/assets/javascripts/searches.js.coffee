# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->

  $.tablesorter.addParser
    id: "clipper"
    is: (s) ->
      false

    format: (s) ->
      # s.toLowerCase().replace(/good/, 2).replace(/medium/, 1).replace /bad/, 0
      a = parseInt(s, 10)
      #console.log(a)
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
  ).tablesorterPager container: $("#pager")
