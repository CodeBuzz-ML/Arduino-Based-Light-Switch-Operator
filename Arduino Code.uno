#include <Servo.h>

const int trigPin1 = 9;
const int echoPin1 = 10;
const int trigPin2 = 11;
const int echoPin2 = 12;
const int servoPin = 6;

Servo myServo;

int peopleCount = 0;
bool lightOn = false;

void setup() {
    pinMode(trigPin1, OUTPUT);
    pinMode(echoPin1, INPUT);
    pinMode(trigPin2, OUTPUT);
    pinMode(echoPin2, INPUT);
    myServo.attach(servoPin);
    myServo.write(0); // Initial position of the servo
    Serial.begin(9600);
}

void loop() {
    long duration1, distance1, duration2, distance2;

    // Sensor 1
    digitalWrite(trigPin1, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin1, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin1, LOW);
    duration1 = pulseIn(echoPin1, HIGH);
    distance1 = duration1 * 0.034 / 2;

    // Sensor 2
    digitalWrite(trigPin2, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin2, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin2, LOW);
    duration2 = pulseIn(echoPin2, HIGH);
    distance2 = duration2 * 0.034 / 2;

    // Check if someone enters the room
    if (distance1 < 50 && distance2 > 50) {
        peopleCount++;
        delay(1000); // Debounce delay
    }

    // Check if someone exits the room
    if (distance2 < 50 && distance1 > 50) {
        peopleCount--;
        delay(1000); // Debounce delay
    }

    // Control the light switch
    if (peopleCount > 0 && !lightOn) {
        myServo.write(90); // Turn on the light
        lightOn = true;
    } else if (peopleCount == 0 && lightOn) {
        myServo.write(0); // Turn off the light
        lightOn = false;
    }

    Serial.print("People Count: ");
    Serial.println(peopleCount);
    delay(500);
}


/*
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
    Pin 11 ---------------- TRIG (Ultrasonic Sensor 2)
    Pin 12 ---------------- ECHO (Ultrasonic Sensor 2)
    Pin 6  ---------------- Signal (Servo Motor)
    5V   ------------------ VCC (Ultrasonic Sensor 1, Ultrasonic Sensor 2, Servo Motor)
    GND  ------------------ GND (Ultrasonic Sensor 1, Ultrasonic Sensor 2, Servo Motor)
*/