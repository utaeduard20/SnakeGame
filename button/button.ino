#include <Keyboard.h>

const int buttonPin1 = 2;
const int buttonPin2 = 3;
const int buttonPin3 = 4;
const int buttonPin4 = 5;

int buttonState1 = 0;
int buttonState2 = 0;
int buttonState3 = 0;
int buttonState4 = 0;
void setup() {
  // put your setup code here, to run once:
pinMode(buttonPin1, INPUT);
pinMode(buttonPin2, INPUT);
pinMode(buttonPin3, INPUT);
pinMode(buttonPin4, INPUT);
Keyboard.begin();
}

void loop() {
  // put your main code here, to run repeatedly:
 buttonState1 = digitalRead(buttonPin1);
 buttonState2 = digitalRead(buttonPin2);
 buttonState3 = digitalRead(buttonPin3);
 buttonState4 = digitalRead(buttonPin4);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState1 == HIGH) {
    Keyboard.press(KEY_UP_ARROW);
    delay(20);
    Keyboard.release(KEY_UP_ARROW);
  }
  if (buttonState2 == HIGH) {
    Keyboard.press(KEY_DOWN_ARROW);
    delay(20);
    Keyboard.release(KEY_DOWN_ARROW);
    
  } 
  if (buttonState3 == HIGH) {
    Keyboard.press(KEY_LEFT_ARROW);
    delay(20);
    Keyboard.release(KEY_LEFT_ARROW);
    
  } 
  if (buttonState4 == HIGH) {
    Keyboard.press(KEY_RIGHT_ARROW);
    delay(20);
    Keyboard.release(KEY_RIGHT_ARROW);
    
  }  
}
