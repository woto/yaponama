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
  
  Application.jug.subscribe $.cookie('channel'), (data) ->
    console.log data
    #alert(data)
    #$("#info").append(data)

    $(".info[data-catalog-number='"+data['catalog_number']+"'][data-manufacturer='"+data['manufacturer']+"']").each (i, element) ->
      $(element).attr('src', '/assets/information.png')
    
    if ($("#info").length > 0)
      if data['caps'] == 'Toyota EPC'
        if data['command'] = 'part_number_application_to_models'
          if $("#toyota_epc_part_number_application_to_models").length <= 0
            content = " 
                        <h1> Таблица применимости детали xxxxx </h1>
                        <p><span class='label important'>К сведению</span> Перед вами отображена таблица применимости детали ... эти сведения используют профессиональные служащие концерна Toyota... описать значение столбцов и пр. Описать что такое PNC (Part Number Catalog); Кол-во; Что если в столбце Кат. номер отображается несколько каталожных номеров; Что значит кол-во, Catalog, Модель, Регион; Каким образом читать Описание, цифры двигателя, кузова; сокращения, что значит регион и т.д. Преподнести таким образом, чтобы действительно убедить, что это 100% сведения. </p>
                        <br />
                        <table class='zebra-striped' id='toyota_epc_part_number_application_to_models'>
                          <tr>
                            <th>№</th>
                            <th>Кат. номер</th>
                            <th>PNC</th>
                            <th>Кол-во</th>
                            <th>Catalog</th>
                            <th>Модель</th>
                            <th>Период пр-ва</th>
                            <th>Описание</th>
                            <th>Регион</th>
                          </tr>
                        </table> "
            $("#info").append(content)
            
          $("#toyota_epc_part_number_application_to_models").append("<tr>
            <td>" + data['line'][0] + "</td>
            <td>" + data['line'][1] + "</td>
            <td>" + data['line'][2] + "</td>
            <td>" + data['line'][3] + "</td>
            <td>" + data['line'][4] + "</td>
            <td>" + data['line'][5] + "</td>
            <td>" + data['line'][6] + "</td>
            <td>" + data['line'][7] + "</td>
            <td>" + data['area'] + "</td>
            </tr>")

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
  
