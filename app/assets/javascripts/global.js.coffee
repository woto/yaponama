# Juggernaut

$ ->
  window.subscribedChannels = []
  window.jug = new Juggernaut

window.subscribe = (channelsToSubscribe) -> 

  for idx, subscribedChannel of subscribedChannels
    jug.unsubscribe(subscribedChannel)
    
  i = 0

  for channelToSubscribe of channelsToSubscribe
    channel = channelToSubscribe + ":" + channelsToSubscribe[channelToSubscribe]
    subscribedChannels.push(channel)
    jug.subscribe channel, (data) ->
      console.log(data)

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
  
