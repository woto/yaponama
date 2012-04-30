var redis   = require("redis");
var colors = require('colors');
var sub = redis.createClient();
var pub = redis.createClient();
//redis.debug_mode = true;

sub.on("pmessage", function(channel, msg, data){

  console.log('channel'.green)
  console.log(channel.green);
  console.log('msg'.red)
  console.log(msg.red);
  console.log('data'.grey);
  console.log(data.grey)
  console.log('');

  data = JSON.parse(data);

  switch (msg) {
    case 'queen':
      // Получаем список заинетересованных каналов и перенаправляем им "в реальном времени" все, что получили
      // от клиентов
      pub.smembers('c:' + data['catalog_number'] + ":" + data['manufacturer'], function(err, channels){
        var msg = {
          "channels": channels,
          "data": data
        }
        pub.publish("juggernaut", JSON.stringify(msg));
      });

      // По-пути записав в 'i...', чтобы всем новым зашедшим сразу отдать результат в промежутке, когда
      // данные имеются частично
      pub.lpush('i:' + data['catalog_number'] + ":" + data['manufacturer'], JSON.stringify(data))
      break;
    case "juggernaut:custom":
      command = data['data']['command'];

      switch(command) {

        case "info":

          // Добавляем в список получаетелей
          key = 'c:' + data['data']['catalog_number'] + ":" + data['data']['manufacturer']
          pub.sadd(key, data['data']['channel'], function(err, reply){
            if(reply == 1) {
              // Отдаем, что уже есть на данный момент
              pub.lrange('i:' + data['data']['catalog_number'] + ":" + data['data']['manufacturer'], 0, -1, function(err, replies){
                replies.forEach(function(reply, i){
                  var msg = {
                    "channels": data['data']['channel'],
                    "data": JSON.parse(reply)
                  }
                  pub.publish("juggernaut", JSON.stringify(msg));
                })
              });

              // TODO избавиться от l:.... и для c:.... задать ttl
              // и по-возможности узнать или переделать так чтобы из c:...
              // я смог удалять каналы

              // Плодим дочерние, если не делали этого
              pub.incr('l:' + data['data']['catalog_number'] + ":" + data['data']['manufacturer'], function(err, reply){
                if (reply == '1') {

                  switch(data["data"]["manufacturer"]) {
                    case "TOYOTA":
                      areas = ['Europe', 'General', 'USA, Canada', 'Japan']
                      for (var i=0; i<areas.length; i++){
                        
                        pub.publish('bee', JSON.stringify({
                          'caps': 'Toyota EPC', 
                          'manufacturer': data['data']['manufacturer'], 
                          'area': areas[i], 
                          'command': 'part_number_application_to_models', 
                          'catalog_number': data['data']['catalog_number']
                        }))
                      }

                      pub.publish('bee', JSON.stringify({
                        'caps': 'Toyota Microcat', 
                        'manufacturer': data['data']['manufacturer'], 
                        'command': 'part_number_application_to_models_2', 
                        'catalog_number': data['data']['catalog_number']
                      }))
                      break;

                    case "NISSAN":
                      break;

                    case "HYUNDAI":
                      pub.publish('bee', JSON.stringify({
                        'caps': 'Microcat Hyundai',
                        'manufacturer': data['data']['manufacturer'],
                        'command': 'part_number_application_to_models',
                        'catalog_number': data['data']['catalog_number']
                      }))
                      break;

                    case "KIA":
                      pub.publish('bee', JSON.stringify({
                        'caps': 'Microcat KIA',
                        'manufacturer': data['data']['manufacturer'],
                        'command': 'part_number_application_to_models',
                        'catalog_number': data['data']['catalog_number']
                      }))
                      break;

                    case "MITSUBISHI":
                      break;

                    case "FEBEST":
                      pub.publish('bee', JSON.stringify({
                        'caps': 'Febest',
                        'manufacturer': data['data']['manufacturer'],
                        'command': 'specifically_number_info',
                        'channel': data['data']['channel'],
                        'catalog_number': data['data']['catalog_number']
                      }));
                      break;

                    // Невозможно передвинуть отсюда, т.к. начнется гонка условий (race confition)
                    // Надо проработать механизм, чтобы можно было вынести из default в безусловную отправку
                    // запроса в Tecdoc, а не только в случае если данный производитель не описан.
                    // В частности с Toyota этот вопрос рассмотрен и обработан
                    default:
                      pub.publish('bee', JSON.stringify({
                        'caps': 'Tecdoc', 
                        'manufacturer': data['data']['manufacturer'],
                        'command': 'specifically_number_info',
                        'channel': data['data']['channel'],
                        'catalog_number': data['data']['catalog_number']
                      }));
                      break
                  }
                } //
              }); //
            }
          });
          break;
      }
      break;

    case "juggernaut:subscribe":
      break;

    case "juggernaut:unsubscribe":
      break;

  }
  
  //console.log(msg);
  //console.log(channel);
  //console.log(data);
  //console.log('')
});

sub.psubscribe("*");



//client.set("string key", "string val", redis.print);
//client.hset("hash key", "hashtest 1", "some value", redis.print);
//client.hset(["hash key", "hashtest 2", "some other value"], redis.print);
//client.hkeys("hash key", function (err, replies) {
//      console.log(replies.length + " replies:");
//          replies.forEach(function (reply, i) {
//                    console.log("    " + i + ": " + reply);
//                        });
//              client.quit();
//});
