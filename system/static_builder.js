var colors, common, jsdom, redis, window;
redis = require("redis");
colors = require("colors");
jsdom = require("jsdom");
redis = redis.createClient();
window = jsdom.jsdom().createWindow();
jsdom.jQueryify(window, "http://code.jquery.com/jquery-1.7.2.min.js", function() {
  console.log('1');
  common = require("../app/assets/javascripts/common.js");
  console.log('2');
  var $;
  $ = window.$;
  $('body').append('<div id="info">zzz</div>');
  return redis.keys("t:*", function(err, keys) {
    return keys.forEach(function(key) {
      return redis.lrange('i:' + key.slice(2), 0, -1, function(err, datas) {
        return datas.forEach(function(data, i) {
          common.toyota_epc_part_number_application_to_models($.parseJSON(data), window);
          return console.log($('#info').html());
        });
      });
    });
  });
});
