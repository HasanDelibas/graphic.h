#include <graphics.h>
#include <stdio.h>
int main(int argc, char *argv[])
{
initwindow(600,600,"7. Fare Kontrolleri");
int kx=175;
int ky=175;
while(1){
cleardevice();
kx = mousex()-25;
ky = mousey()-25;
line(kx+25,0,kx+25,ky);   line(kx+25,600,kx+25,ky+50);
line(0,ky+25, kx,ky+25);  line(600,ky+25, kx+50,ky+25);
rectangle(kx,ky,kx+50,ky+50);
swapbuffers();
delay(40);
}
return EXIT_SUCCESS;
closegraph();
}
