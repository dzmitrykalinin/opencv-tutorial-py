import cv2
import numpy as np
from matplotlib import pyplot as plt

cap = cv2.VideoCapture(0)

fourcc = cv2.VideoWriter_fourcc(*'MPG2')
out = cv2.VideoWriter('output.avi', fourcc, 20.0, (640, 480))

while(True):
  if not cap.isOpened():
    print('Closed')
    break

  ret, frame = cap.read()
  if ret == True:
    frame = cv2.flip(frame, 0)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    width = cap.get(3)
    height = cap.get(4)
    print(width)
    print(height)
    width = cap.set(3, 320)
    height = cap.set(4, 240)
    out.write(gray)
    cv2.imshow('frame', gray)


    if cv2.waitKey(1) & 0xFF == ord('q'):
      break
  else:
    break

cap.release()
out.release()
cv2.destroyAllWindows()
