#include <iostream>
#include "led.h"
using namespace std;

int main() {
    cout << "Hello World!" << endl;
    led light;
    light.led_on();
    
    return 0;
}
