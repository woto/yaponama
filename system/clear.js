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

redis = require('redis');
client = redis.createClient();

client.keys("*", function(keys_err, keys){ 
  if (keys_err) {callback(keys_err); return; }
  asyncForEach(keys, function(key, next) {
    client.del(key, function(del_err, two){
      if (del_err) {callback(del_err); return; }
      next();
    });
  }, function() {
    process.exit();
  });
});
