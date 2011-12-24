# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  $.tablesorter.addParser
    id: "from_link_extractor"
    is: (s) ->
      false

    format: (s) ->
      s 

    type: "text"

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
      1:
        sorter: "from_link_extractor"
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

		$(".buy-button").live "click", ->
		  $("#wishes-logo").css(
		    left: $(this).offset().left + 30
		    top: $(this).offset().top - 57
		    display: 'block'
		    opacity: 0.2
		  ).animate(
				    opacity: 1
				  ,
				    queue: false
				  , 
				    "slow"
				).animate(
		    path: new $.path.bezier(
  		    start:
	  	      x: $(this).offset().left - 20
		        y: $(this).offset().top - 57
		        angle: 0
		        length: 0

  		    end:
	  	      x: $("#wishes-link").offset().left + 25
		        y: $("#wishes-link").offset().top - 50
		        angle: 98
		        length: 0.4
  		  )
      ,  
        1000
      , ->
  	    $(this).animate(
          opacity: "hide"
        ,
          1000
        )
      )