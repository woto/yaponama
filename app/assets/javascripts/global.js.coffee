window.Application ||= {}

# Juggernaut

Application.publish_queue = []
Application.juggernaut_connected = false
Application.channel_key = ''

Application.connect = ->

  Application.channel_key = Math.random().toString() + "_" + new Date().getTime().toString()

  Application.jug = new Juggernaut

  $.cookie('channel', Application.channel_key, {path: '/'})
  console.log(Application.channel_key)

  #jug.meta = {
  #  random: random
  #}
  # еще есть возможность отправлять получить идентификатор соединения juggernaut в javascript
  

  Application.full_response_checker = {}

  Application.jug.subscribe Application.channel_key, (data) ->

    console.log(data)

    key = data['catalog_number'] + " - " + data['manufacturer']

    unless (Application.full_response_checker[key]?)
      switch data['manufacturer']
        when 'TOYOTA'
          Application.full_response_checker[key] =
            'Toyota EPC - Europe': null
            'Toyota EPC - General': null
            'Toyota EPC - USA, Canada': null
            'Toyota EPC - Japan': null
            #'Microcat Toyota': null 
            'Tecdoc': null
        #when 'KIA'
        #  Application.full_response_checker[key] =
        #    'Microcat KIA': null
        #    'Tecdoc': null
        #when 'MITSUBISHI'
        #  Application.full_response_checker[key] =
        #    'Mitsubishi ASA - Europe' : null
        #    'Mitsubishi ASA - Japan': null
        #    'Mitsubishi ASA - North America': null
        #    'Mitsubishi ASA - General Export': null
        #    'Tecdoc': null
        else
          Application.full_response_checker[key] =
            'Tecdoc': null

    if data['area']?
      caps = data['caps'] + " - " + data['area']
    else
      caps = data['caps']

    if data['data']?
      Application.full_response_checker[key][caps] = true
    else
      Application.full_response_checker[key][caps] = false

    $(".info[data-catalog-number='"+data['catalog_number']+"'][data-manufacturer='"+data['manufacturer']+"']").each (i, element) ->

      if _.all(_.values(Application.full_response_checker[key]), (value) => (value == false))
        $(element).attr('src', '/assets/1x1.gif')

      if _.any(_.values(Application.full_response_checker[key]), (value) => (value == true))
        $(element).attr('src', '/assets/information.png')

    if ($("#info").length > 0 && $("#info").attr('class') != 'static')
      window.common.toyota_epc_part_number_application_to_models(data, $)

  Application.jug.on 'connect', ->
    Application.juggernaut_connected = true
    Application.publish_only_after_connect()

Application.publish_only_after_connect = ->
  if Application.juggernaut_connected
    while message = Application.publish_queue.pop()
      Application.jug.write(message)

Application.publish = (command, catalog_number, manufacturer) ->
  message = new Juggernaut.Message
  message.type = "event"
  message.data = {
    command: command
    catalog_number: catalog_number
    manufacturer: manufacturer
    channel: Application.channel_key
  }

  Application.publish_queue.push(message)
  Application.publish_only_after_connect()

# end of Juggernaut
  
$ ->

  $('a.bill').popover()
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
  
