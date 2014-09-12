#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "Config.h"
#include "Output.h"
#include "Graphics.h"


int8_t displayGrid[xres][yres];

void clearArray(int8_t array[][yres], int size) {
    memset(array,0,size);
}

int main() {

    //Initialise array
    clearArray(displayGrid,sizeof(displayGrid));

    //Initialise devices
    outputInitialise(1);

    //Draw characters of different sizes
    int fontSize = 20;
    int angle = -22;

    drawCharacter(xres/5,yres/4,fontSize,0,65,displayGrid);
    drawCharacter(xres/5*2,yres/4,fontSize,0,66,displayGrid);
    drawCharacter(xres/5*3,yres/4,fontSize,0,109,displayGrid);
    drawCharacter(xres/5*4,yres/4,fontSize,0,83,displayGrid);

    drawCharacter(xres/5,yres/2,fontSize,angle,65,displayGrid);
    drawCharacter(xres/5*2,yres/2,fontSize,angle,66,displayGrid);
    drawCharacter(xres/5*3,yres/2,fontSize,angle,109,displayGrid);
    drawCharacter(xres/5*4,yres/2,fontSize,angle,83,displayGrid);

    drawCharacter(xres/5,yres/4*3,fontSize,-45,65,displayGrid);
    drawCharacter(xres/5*2,yres/4*3,fontSize,-45,66,displayGrid);
    drawCharacter(xres/5*3,yres/4*3,fontSize,-45,109,displayGrid);
    drawCharacter(xres/5*4,yres/4*3,fontSize,-45,83,displayGrid);

    plotLine(0, yres/2, xres-1, yres/2,displayGrid);
    plotLine(xres/2, 0, xres/2, yres-1,displayGrid);

    // int length = 8;
    // int rotation = 45;
    // int size = 1; int Y=30;
    // char buffer[length+1];
    // snprintf (buffer,length+1,"ABCDEFGH");
    //
    // for(int i=0;i<6;i++) {
    //
    //   drawString(xres/4,Y,size,rotation,buffer,length,displayGrid);
    //
    //   size++;
    //   Y+=30;
    // }

    //drawString(xres/4,yres/2,fontSize,rotation,buffer,length,displayGrid);



    //Display OSD to display device
    outputGridToDisplay(displayGrid);

    //Cleanup
	  outputDestroy();

    //Say goodbye
    printf("Have a nice day!\n");

    return 0;
}
