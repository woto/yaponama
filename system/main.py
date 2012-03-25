import redis
from juggernaut import Juggernaut
import time	

jug = Juggernaut()
for event, data in jug.subscribe_listen():
  print event
  print data

##import pdb
#
##msg = {
##  "channels": ["channel1"],
##  "data": "foo"
##}
##
##r.publish("juggernaut", json.dumps(msg))
#
#
#rc = redis.Redis()
#ps = rc.pubsub()
#
##ps.subscribe(['chat', 'juggernaut'])
##rc.publish('foo', 'hello world')
#
#ps.psubscribe("*")
#for item in ps.listen():
#    print item
#    #if item['type'] == 'message':
#    #    print item['channel']
#    #    print item['data']
