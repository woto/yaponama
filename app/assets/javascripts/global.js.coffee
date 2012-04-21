window.Application ||= {}

# Juggernaut

Application.publish_queue = []
Application.juggernaut_connected = false

Application.connect = ->
  Application.jug = new Juggernaut

  if $.cookie('cookie') == null
    $.cookie('cookie', Math.random())

  $.cookie('channel', Math.random())

  #jug.meta = {
  #  random: random
  #}
  # еще есть возможность отправлять получить идентификатор соединения juggernaut в javascript
  
  Application.jug.subscribe $.cookie('channel'), (data) ->
    console.log data
    #alert(data)
    $("#info").append(data)
    # $(interestedElement).after(JSON.stringify(data))

  Application.jug.on 'connect', ->
    Application.juggernaut_connected = true
    Application.publish_only_after_connect()

Application.publish_only_after_connect = ->
  if Application.juggernaut_connected
    while message = Application.publish_queue.pop()
      console.log message
      Application.jug.write(message)

Application.publish = (command, catalog_number, manufacturer, element) ->
  message = new Juggernaut.Message
  message.type = "event"
  message.data = {
    command: command
    catalog_number: catalog_number
    manufacturer: manufacturer
    element: element
    cookie: $.cookie('cookie')
    channel: $.cookie('channel')
  }

  Application.publish_queue.push(message)
  Application.publish_only_after_connect()

# end of Juggernaut
  
$ ->
  Application.connect()


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
  
