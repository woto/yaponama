import redis
from juggernaut import Juggernaut
import time	
import pdb

rs = redis.Redis()
jug = Juggernaut(rs)

for event, data in jug.subscribe_listen():
  print event
  print data

  if event == "custom":
    #pdb.set_trace()
    if data['data']['command'] == 'info':
      rs.publish('workers', data)
  elif event == "subscribe":
    pass
  elif event == "unsubscribe":
    pass

##msg = {
##  "channels": ["channel1"],
##  "data": "foo"
##}
##
##r.publish("juggernaut", json.dumps(msg))
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
