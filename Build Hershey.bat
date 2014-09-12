mingw32-gcc -std=c99 -ID:/_libs/opencv/build/include -c src/Graphics.c -o bld/Graphics.o
mingw32-gcc -std=c99 -ID:/_libs/opencv/build/include -c src/Output.c -o bld/Output.o
mingw32-gcc -std=c99 -ID:/_libs/opencv/build/include -c src/main.c -o bld/main.o
mingw32-gcc  -o Hershey.exe bld/Graphics.o bld/Output.o bld/main.o -LD:/_libs/opencv/build/x86/mingw/lib -lm -lopencv_core231 -lopencv_imgproc231 -lopencv_highgui231
