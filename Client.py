from __future__ import print_function

import json
import socket
import time

def read():
	HOST, PORT = 'localhost', 4481
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.connect((HOST, PORT))
	reading = sock.recv(16384)
	sock.close
	return reading

def strfprediction(prediction):
	delta = prediction - time.time()
	minutes, seconds = divmod(delta, 60)
	hours, minutes = divmod(minutes, 60)
	return "%d:%02d:%02d" % (hours, minutes, seconds)

while True:
	reading = read()	
	for route, predictions in json.loads(reading).items():
		count = len(predictions)
		print("%s(%d):" % (route, count), end=" ")
		for prediction in predictions:
			print(strfprediction(prediction), end=" ")
		print("")
	time.sleep(5)

