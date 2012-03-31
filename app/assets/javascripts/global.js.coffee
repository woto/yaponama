window.Application ||= {}

# Juggernaut

Application.connect = ->
  Application.jug = new Juggernaut
  if $.cookie('cookie') == null
    $.cookie('cookie', Math.random())

  # TODO Было ...random(), не помню как хотел здесь сделать
  #random = Math.random()
  random = $.cookie('cookie')

  #jug.meta = {
  #  random: random
  #}
  
  Application.jug.subscribe random, (data) ->
    console.log data
    #alert(data)
    $("#info").append(data)
    #alert('1')
    #alert(data)
    # $(interestedElement).after(JSON.stringify(data))

Application.publish = (command, marker, catalog_number, manufacturer, priority, element) ->
  message = new Juggernaut.Message
  message.type = "event"
  message.data = {
    command: command
    priority: priority
    marker: marker 
    catalog_number: catalog_number
    manufacturer: manufacturer
    element: element
    cookie: $.cookie('cookie')
  }

  Application.jug.write(message)

# end of Juggernaut
  
$ ->

  $(".alert-message").alert()
  $('.dropdown').dropdown()

  delay = (->
    timer = 0
    (callback, ms) ->
      clearTimeout timer
      timer = setTimeout(callback, ms)
  )()

  once = (timeout) ->
    width = Math.round( $(".content").width() / 4.4 )
    delay (->
      $(".media-grid a").css
        marginLeft: Math.round(width/30)
        # marginRight: Math.round(width/11)

      $(".thumbnail").css
        width: width
    ), timeout

  $(window).resize ->
    once(20)

  once(0)
  
