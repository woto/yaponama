# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  $("input[rel=popover]").popover(placement: "left").click (e) ->
    #e.preventDefault()
    #e.stopImmediatePropagation()
 

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
      4:
        sorter: "clipper"
      5:
        sorter: "clipper"
      6:
        sorter: "clipper"
      8:
        sorter: "clipper"
    widthFixed: true
  )

  # TODO Здесь должен быть какой-то механизм дублирующий функционал страницы info
  # позволяющий пользователю заведомо узнать имеется или нет информация по детали, не заставляя
  # его узнавать это по щелчку
  #
  

  $("table#result-prices").bind "applyWidgets", ->
    channels = {}
    for line in $(this).find("tr .info")
      channel = $(line).parent().attr('href')
      if typeof channels[channel] is "undefined"
        channels[channel] = []
      channels[channel].push $(line).attr("id")

    subscribe(channels)

  $("table#result-prices").tablesorterPager 
    container: $("#pager")
		# Не забыть, что это в 2-х местах
    size: 8


  # Кнопки очистки полей ввода
  $("#clear-manufacturer").click ->
    $("#manufacturer").val('')

  $("#clear-catalog-number").click ->
    $("#catalog-number").val('')

		$(".buy-button").live "click", ->
		  cloned = $("#wishes-logo").clone()
		
		  cloned.css(
		    display: "block"
		    opacity: 0.2
		  ).appendTo('body').animate(
				    opacity: 1
				  ,
				    queue: false
				  , 
				    "slow"
				).animate(
		    path: new $.path.bezier(
  		    start:
	  	      x: $(this).offset().left
		        y: $(this).offset().top
		        angle: 0
		        length: 0

  		    end:
	  	      x: $("#wishes-link").offset().left + 20
		        y: $("#wishes-link").offset().top + 5
		        angle: 98
		        length: 0.4
  		  )
      ,  
        1000
      , ->
  	    $(this).animate(
          opacity: "hide"
        ,
          500
        )
      )

	
	# Табличка Каталожный номер
	
  vinModal = $("#catalog-number-modal").modal(
    backdrop: true
    modal: true
  )

  $(".catalog-number-link").click ->
    vinModal.toggle()

  $("#catalog-number-close").live "click", ->
    vinModal.modal('hide')

	
	# Табличка Замены
	
  replacementsModal = $("#replacements-modal").modal(
    backdrop: true
    modal: true
  )

  $(".replacements-link").click ->
    replacementsModal.toggle()

  $("#replacements-close").live "click", ->
    replacementsModal.modal('hide')
