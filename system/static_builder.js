var colors, common, jsdom, redis, window;
redis = require("redis");
colors = require("colors");
jsdom = require("jsdom");
redis = redis.createClient();
var window = jsdom.jsdom().createWindow();
var _ = require('underscore')._;


function asyncForEach(array, iterator, then) {
  function loop(i) {
    if (i < array.length) {
      iterator(array[i], function() {
        loop(i + 1);
      })
    }
    else {
      then();
    }
  }
  loop(0);
}

jsdom.jQueryify(window, "jquery-1.7.2.min.js", function() {
  common = require("../app/assets/javascripts/common.js");
  multi = redis.multi();
  multi.keys("t:*", function(err, keys) {
    console.log('--')
    keys_length = keys.length
    console.log('keys')
    console.log(keys);
    asyncForEach(keys, function(key, next_key) {
      console.log('^^')
      where = window.$(window.$('body').html('<div class="static"></div>'));
      console.log('key')
      console.log(key);
      key_part = key.slice(2);
      redis.get('t:' + key_part, function(err, tdata){
        console.log(key);
        if(err) {
          console.log(err);
          process.exit();
        }
        //console.log(tdata);
        curr_date = (new Date()).getTime();
        tdata_date = parseInt(tdata);
        diff_date = curr_date - tdata_date;
        console.log('diff_date')
        console.log(diff_date);
        if(diff_date > 600000)
        {
          var data_status = 'unavaliable'
          redis.lrange('i:' + key_part, 0, -1, function(err, datas) {
            asyncForEach(datas, function(data, next_data){
              parsed_data = window.$.parseJSON(data)
              if(parsed_data['data']){
                data_status = 'avaliable'
              }
              console.log('data');
              console.log(data)
              common.toyota_epc_part_number_application_to_models(where, parsed_data, window.$, _);
              next_data();
              //console.log(new Date());
            }, function(){
                console.log(data_status)
                console.log('Последний элемент')
                var fs = require('fs');
                //console.log(window.$('#info').html());
                fs.writeFile('./parts_info/s:' + key_part.replace(/[^а-яА-Яa-zA-z0-9]/gi, '_'), where.html().toString(), function(err) {
                  console.log('s written');
                  if(err) {
                    console.log('Ошибка записи')
                    console.log(err);
                  }
                  else {
                    console.log('Удаляем t');
                    redis.del('t:' + key_part);

                    // Данные сами удалятся в соответствии с ttl redis'a
                    //console.log('Удаляем l');
                    //redis.del('l:' + key_part);
                    //console.log('Удаляем c');
                    //redis.del('c:' + key_part);
                    //console.log('Удаляем i');
                    //redis.del('i:' + key_part);

                    fs.writeFile('./parts_info/f:' + key_part.replace(/[^а-яА-Яa-zA-z0-9]/gi, '_') , data_status.toString(), function(err) {
                      console.log('f written')
                      if(err){
                        console.log('Ошибка записи');
                        console.log(err);
                      }

                      //process.exit();
                      next_key();
                    })
                  }
                });
            });
          });
        }
        else 
        {
          console.log('Вызываем next_key');
          next_key();
        }
      });
  }, function() {
      // Выходим если элемент последний и не вышли ранее в процессе записи
      console.log('Выходим');
      process.exit();
    });
  });
  multi.exec();
});
