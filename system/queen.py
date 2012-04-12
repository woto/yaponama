# -*- coding: utf-8 -*-

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
  print ''

  # CUSTOM
  if event == "custom":
    command = data['data']['command']

    # INFO
    if command == 'info':

      # TOYOTA
      #pdb.set_trace()
      if data['data']['manufacturer'] == "TOYOTA":

         for area in ['Europe', 'General', 'USA, Canada', 'Japan']:
           rs.publish('bee', json.dumps({
             'caps': 'Toyota EPC', 
             'manufacturer': data['data']['manufacturer'], 
             'area': area, 
             'command': 'part_number_application_to_models', 
             'channel': data['data']['channel'],
             'catalog_number': data['data']['catalog_number'],
           }))

         # Тут еще будет Microcat Toyota

      # NISSAN
      elif data['data']['manufacturer'] == "NISSAN":
        pass

      # MITSUBISHI
      elif data['data']['manufacturer'] == "MITSUBISHI":
        pass

      rs.publish('bee', json.dumps({
        'caps': 'Tecdoc', 
        'manufacturer': data['data']['manufacturer'],
        'command': 'specifically_number_info',
        'channel': data['data']['channel'],
        'catalog_number': data['data']['catalog_number']
      }))

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
