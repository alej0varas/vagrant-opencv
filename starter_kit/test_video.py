import numpy as np
import cv2

cap = cv2.VideoCapture('test_monkey.avi')

while(cap.isOpened()):
	ret, frame = cap.read()


	# add a transulcent circle
	overlay = frame.copy()
	cv2.circle(overlay, (100, 100), 10, (255,0,0), -1, cv2.CV_AA)
	opacity = 0.4
	cv2.addWeighted(overlay, opacity, frame, 1 - opacity, 0, frame)

	# add a transulcent circle
	overlay = frame.copy()
	cv2.circle(overlay, (100, 110), 6, (0,255,0), -1, cv2.CV_AA)
	opacity = 0.4
	cv2.addWeighted(overlay, opacity, frame, 1 - opacity, 0, frame)
	

	cv2.imshow('frame', frame)
	if cv2.waitKey(1) & 0xFF == ord('q'):
	    break

cap.release()
cv2.destroyAllWindows()