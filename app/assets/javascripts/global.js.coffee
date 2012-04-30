window.Application ||= {}

# Juggernaut

Application.publish_queue = []
Application.juggernaut_connected = false

Application.connect = ->
  Application.jug = new Juggernaut

  $.cookie('channel', Math.random(), {path: '/'})

  #jug.meta = {
  #  random: random
  #}
  # еще есть возможность отправлять получить идентификатор соединения juggernaut в javascript
  

  Application.toyota_epc_full_response_checker = {}

  Application.jug.subscribe $.cookie('channel'), (data) ->
    console.log data
    #alert(data)
    #$("#info").append(data)
    
    if(data['caps'] == 'Toyota EPC')
      unless (Application.toyota_epc_full_response_checker[data['catalog_number']]?)
        Application.toyota_epc_full_response_checker[data['catalog_number']] = {}
      if data['data']?
        Application.toyota_epc_full_response_checker[data['catalog_number']]['Japan'] = true
        Application.toyota_epc_full_response_checker[data['catalog_number']]['General'] = true
        Application.toyota_epc_full_response_checker[data['catalog_number']]['USA, Canada'] = true
        Application.toyota_epc_full_response_checker[data['catalog_number']]['Europe'] = true
      else
        # TODO CHECK вот эта проверка возникла после того, как я обнаружил, что при поиске каталожного номера
        # 0446533340 с учетом замен на странице 3 деталь 0446544140 отобразилась неправильно. Получилось это
        # из-за того, что я безусловно из bee сначала отправляю пустышку. Конкретно по этому номеру получается,
        # что эта деталь находится только в Japan и как-то получается так, что пустышка проскакивает позже, чем
        # уже пришедшие имеющиеся данные, отсюда получается, что весь ассоциативный массив с регионами превращается
        # в false. Надо проверить смогу ли я точно знать, найдена деталь или нет (на основе lines хотел в bee
        # поковырять)
        #if Application.toyota_epc_full_response_checker[data['catalog_number']][data['area']] != true
        #  Application.toyota_epc_full_response_checker[data['catalog_number']][data['area']] = false
        #
        # TODO CHECK проверить предыдущее выражение, по-моему это уже лишнее, т.к. в Toyota EPC сделал так, что
        # null отправляется только в случае если данные в данном регионе действительно не найдены
        Application.toyota_epc_full_response_checker[data['catalog_number']][data['area']] = false

    $(".info[data-catalog-number='"+data['catalog_number']+"'][data-manufacturer='"+data['manufacturer']+"']").each (i, element) ->
      # Если не гоню, то правильно будет это делать здесь, т.к. это чисто клиентская забота отображать сведения о том, что найдены или не найдены данные
        #console.log('1')

      if data['caps'] == 'Toyota EPC'
        if _.keys(Application.toyota_epc_full_response_checker[data['catalog_number']]).length == 4
          if $(element).attr('src') != '/assets/information.png'
            $(element).attr('src', '/assets/1x1.gif')

        for area, value of Application.toyota_epc_full_response_checker[data['catalog_number']]
          if(value == true)
            $(element).attr('src', '/assets/information.png')
            break
      else
        if data['data']?
          $(element).attr('src', '/assets/information.png')
        else
          if $(element).attr('src') != '/assets/information.png'
            $(element).attr('src', '/assets/1x1.gif')


        
    
    if ($("#info").length > 0)
      window.common.toyota_epc_part_number_application_to_models(data)

    #$(interestedElement).after(JSON.stringify(data))

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
    channel: $.cookie('channel')
  }

  Application.publish_queue.push(message)
  Application.publish_only_after_connect()

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
  
