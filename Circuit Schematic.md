
Schematic Diagram:

Ultrasonic Sensor 1:
VCC ------------------- 5V
GND ------------------- GND
TRIG ------------------ Pin 9
ECHO ------------------ Pin 10

Ultrasonic Sensor 2:
VCC ------------------- 5V
GND ------------------- GND
TRIG ------------------ Pin 11
ECHO ------------------ Pin 12

Servo Motor:
VCC ------------------- 5V
GND ------------------- GND
Signal ---------------- Pin 6

Arduino:
Pin 9  ---------------- TRIG (Ultrasonic Sensor 1)
Pin 10 ---------------- ECHO (Ultrasonic Sensor 1)
GND  ------------------ GND (Ultrasonic Sensor 1, Ultrasonic Sensor 2, Servo Motor)
Pin 11 ---------------- TRIG (Ultrasonic Sensor 2)
Pin 12 ---------------- ECHO (Ultrasonic Sensor 2)
Pin 6  ---------------- Signal (Servo Motor)
5V   ------------------ VCC (Ultrasonic Sensor 1, Ultrasonic Sensor 2, Servo Motor)
