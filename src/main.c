#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "Config.h"
#include "Graphics.h"


int8_t displayGrid[xres][yres];

int main() {

    //Initialise array
    clearArray(displayGrid,sizeof(displayGrid));

    //Initialise devices
    outputInitialise(1);

    //Draw characters of different sizes
    int fontSize = 1;
    drawCharacter(xres+xres/2,yres,fontSize,135,grid);

    //Say goodbye
    printf("Have a nice day!\n");

    return 0;
}
