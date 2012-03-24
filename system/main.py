import redis
from juggernaut import Juggernaut
import time	
#import pdb

#r = redis.Redis('192.168.2.3')
#jug = Juggernaut(r)
jug = Juggernaut()

for event, data in jug.subscribe_listen():
    print event
    print data
    if event == 'subscribe':
      #time.sleep(1)
      jug.publish(data['channel'], {'user10': 'privet', 'aaa': 'b', '1': 0	})
      print 'start subjobs here'
    elif event == 'unsubscribe':
      #time.sleep(1)
      print 'Stops jobs or lower ther proritets!'
