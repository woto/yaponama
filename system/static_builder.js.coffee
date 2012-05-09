common = require("../app/assets/javascripts/common.js.coffee")
redis = require("redis")
colors = require("colors")
jsdom = require("jsdom");
redis = redis.createClient()
window = jsdom.jsdom().createWindow();

jsdom.jQueryify window, "http://code.jquery.com/jquery-1.7.2.min.js", ->
  $ = window.$;
  $('body').append '<div id="info">zzz</div>'
  #window.$("body").append "<div class=\"testing\">Hello World, It works</div>"
  #console.log window.$(".testing").text()
  #console.log($('body').html())
  #console.log "there have been", window.$("a").length, "nodejs releases!"
  redis.keys "t:*", (err, keys) ->
      #console.log "got"
      #console.log keys
      keys.forEach (key) ->
        redis.lrange 'i:' + key.slice(2), 0, -1, (err, datas) ->
          datas.forEach (data, i) ->
            common.toyota_epc_part_number_application_to_models($.parseJSON(data))
      console.log($('#info').html())
