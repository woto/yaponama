window.Application ||= {}

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  $('#random-catalog-number').click ->
    $('input#catalog-number').val($(this).html())

  $('.dropdown').dropdown()
  $(".alert-message").alert()
  $('a.bill').popover()

  Application.init_info = (roo) ->

    Application.connect()

    for element in roo.find(".info")
      catalog_number = $(element).attr('data-catalog-number')
      manufacturer = $(element).attr('data-manufacturer')

      # DEBUG Закомментировать для отладки
      # Этот (оптимальный способ пока не будет работать)
      # т.к. если быстро пробежаться по всем страницам и прийти на последнюю
      # то на предыдущих статус не обновится, т.к. в момент получения данных
      # таблица не содержит этих элементов, которые ищатся в момент получения.
      # По идее их надо как-то регистрировать для получения просто
      #if($(element).attr('src') == '/assets/init.gif')
      #  $(element).attr('src', '/assets/loading.gif')
      #  Application.publish('info', catalog_number, manufacturer)

      # Отправляем запрос только если статус не (unavaliable) 1x1.gif и не (avaliable) informagion.png
      # Т.е. либо (unknown) loading.gif либо (unknown) init.gif
      if($(element).attr('src') == '/assets/init.gif' or
      $(element).attr('src') == '/assets/loading.gif')
        $(element).attr('src', '/assets/loading.gif')
        Application.publish('info', catalog_number, manufacturer)

  # Было вырезано из applyWidgets
  Application.init_info($('body'))


  Application.reinit_search = ->
    $('a.days').popover({placement: 'left'})
    $('a[rel=twipsy]').twipsy()

    $("table#result-prices tr").live "click", ->
      Application.showLoading()
      window.location = $(this).children().eq(2).children().attr('href')

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
      sortList: [[0, 1], [6, 0]]
    )



    # TODO Здесь должен быть какой-то механизм дублирующий функционал страницы info
    # позволяющий пользователю заведомо узнать имеется или нет информация по детали, не заставляя
    # его узнавать это по щелчку
   
    $("table#result-prices").bind "applyWidgets", ->

      Application.init_info($(this))



    $("table#result-prices").tablesorterPager 
      container: $("#pager")
      # Не забыть, что это в 2-х местах
      size: 15

  Application.reinit_search()

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

Application.toTop = ->
  $("html, body").animate({scrollTop: 0}, 'fast')

Application.showLoading = ->
  Application.toTop();
  $("#loading").css "top", (parseInt(($(window).height() - $("#loading").innerHeight() - $(window).height()/2 )/2, 10)) + "px"
  $("#loading").css "left", parseInt(($(window).width() - $("#loading").innerWidth())/2, 10) + "px"
  $("#loading").show()
  $("#search-area-parent").animate({ opacity: 0 })

$(".ajax-search").live "click", ->
  Application.showLoading()
