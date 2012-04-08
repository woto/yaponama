var redis   = require("redis");

var msg = {
    "channels": ["channel1", "0.20572326495312154"],
      "data": "foo"
};

var client = redis.createClient();

client.on("pmessage", function(channel, msg, data){
  channel = JSON.stringify(channel);
  msg = JSON.stringify(msg);
  data = JSON.stringify(data);
  console.log(msg);
  console.log(channel);
  console.log(data);
  console.log('')
});

client.psubscribe("juggernaut");



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
