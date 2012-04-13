var redis   = require("redis");
var sub = redis.createClient();
var pub = redis.createClient();
//redis.debug_mode = true;

sub.on("pmessage", function(channel, msg, data){

  data = JSON.parse(data);

  switch(msg) {
    case "juggernaut:custom":
      command = data['data']['command']
      switch(command) {
        case "info":
          switch(data["data"]["manufacturer"]) {
            case "TOYOTA":
              areas = ['Europe', 'General', 'USA, Canada', 'Japan']
              for (var i=0; i<areas.length; i++){
                 pub.publish('bee', JSON.stringify({
                   'caps': 'Toyota EPC', 
                   'manufacturer': data['data']['manufacturer'], 
                   'area': areas[i], 
                   'command': 'part_number_application_to_models', 
                   'channel': data['data']['channel'],
                   'catalog_number': data['data']['catalog_number'],
                 }))
              }

              // Тут будет Microcat Toyota

              break;
            case "NISSAN":
              break;

            case "MITSUBISHI":
              break;

          }
          pub.publish('bee', JSON.stringify({
            'caps': 'Tecdoc', 
            'manufacturer': data['data']['manufacturer'],
            'command': 'specifically_number_info',
            'channel': data['data']['channel'],
            'catalog_number': data['data']['catalog_number']
          }));
          break;
        case "mark down":
          break;
        case "new marker":
          break;
      }
      break;
    case "juggernaut:subscribe":
      console.log('subscribe');
      break;
    case "juggernaut:unsubscribe":
      console.log('unsubscribe');
      break;
    // default:
  }
  
  //console.log(msg);
  //console.log(channel);
  //console.log(data);
  //console.log('')
});

sub.psubscribe("juggernaut:*");



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
