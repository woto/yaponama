window.Application ||= {}

# Juggernaut

Application.connect = ->
  Application.jug = new Juggernaut
  if $.cookie('stream') == null
    $.cookie('stream', Math.random())

  random = Math.random()
  #jug.meta = {
  #  random: random
  #}
  
  Application.jug.subscribe random, (data) ->
    console.log data
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
    cookie: $.cookie('stream')
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
  
