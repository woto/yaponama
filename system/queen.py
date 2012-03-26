import redis
from juggernaut import Juggernaut
import time	
import pdb
import json

rs = redis.Redis()
jug = Juggernaut(rs)

for event, data in jug.subscribe_listen():
  print event
  print data

  # CUSTOM
  if event == "custom":
    command = data['data']['command']

    # INFO
    if command == 'info':
      manufacturer = data['data']['manufacturer']
      catalog_number = data['data']['catalog_number']

      # TOYOTA
      if manufacturer == "TOYOTA":
         for area in ['Europe', 'General', 'USA, Canada', 'Japan']:
           rs.publish('bee', json.dumps({'caps': 'Toyota EPC', 'data': data}))

      # NISSAN
      elif manufacturer == "NISSAN":
        pass

      # MITSUBISHI
      elif manufacturer == "MITSUBISHI":
        pass
      rs.publish('bee', json.dumps({'caps': 'Tecdoc', 'data': data}))

    # MARK DOWN
    elif command == 'mark down':
      pass

    # NEW MARKER
    elif command == 'new marker':
      pass

  # SUBSCRIBE
  elif event == "subscribe":
    pass

  # UNSUBSCRIBE
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
