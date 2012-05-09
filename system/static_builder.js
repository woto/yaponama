var colors, common, jsdom, redis, window;
redis = require("redis");
colors = require("colors");
jsdom = require("jsdom");
redis = redis.createClient();
window = jsdom.jsdom().createWindow();
jsdom.jQueryify(window, "jquery-1.7.2.min.js", function() {
  common = require("../app/assets/javascripts/common.js");
  window.$('body').append('<div id="info"></div>');
  redis.keys("t:*", function(err, keys) {
    keys.forEach(function(key) {
      redis.lrange('i:' + key.slice(2), 0, -1, function(err, datas) {
        datas.forEach(function(data, i) {
          common.toyota_epc_part_number_application_to_models(window.$.parseJSON(data), window.$);
          // console.log(window.$('#info').html());
          redis.set('s:' + key.slice(2), window.$('#info').html());
          console.log(new Date());
        });
      });
    });
  });
});
