redis = require('redis');
client = redis.createClient();
client.keys("*", function(one, two){ client.del(two, function(one, two){})})
