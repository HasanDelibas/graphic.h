#include <graphics.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
void *rgemi[36];
void *rgemim[36];
void *rsayi[11];
void *rarka;
int main(int argc, char *argv[])
{


initwindow(1000,700,"5. Uzay Gemisi : Dönebilen ve Mask Edilmiþ Resim Örneði",0,0);
//setviewport(0,0,1488,600,0);
cleardevice();
swapbuffers();
setbkcolor(COLOR(0,0,0));

readimagefile("rsm.jpg" ,0,0,1000,700);
rarka= malloc(imagesize(0 ,0,1000,700)); 
getimage(0,0,1000,700, rarka);


readimagefile("rsmm.bmp",0,0,672,672 );
for (int r=0;r<36;r++){
rgemim[r]= malloc(imagesize(0 ,0,112,112));
getimage((r%6)*112,(r/6)*112,(r%6)*112+112,(r/6)*112+112, rgemim[r]);
}

readimagefile("rsm.bmp",0,0,672,672 );
for (int r=0;r<36;r++){
rgemi[r]= malloc(imagesize(0 ,0,112,112));
getimage((r%6)*112,(r/6)*112,(r%6)*112+112,(r/6)*112+112, rgemi[r]);
}





int sa =0;
double dk=0; //=tm.tm_min;
double sn=0; //=tm.tm_sec;
int konumsaatx=0;
int konumsaaty=545;

double kx=400;
double ky=400;
double h=0;
double yon=0;
int yn=0;

while(1){
cleardevice();
    putimage(0,0,rarka,COPY_PUT);// GEmi
setbkcolor(COLOR(0,0,0));
if (GetAsyncKeyState(VK_UP)) { h+=0.1; }
if (GetAsyncKeyState(VK_DOWN)){ h-=0.1; }
kx+=h*cos((double)yon*6.283/36);
ky-=h*sin((double)yon*6.283/36);

if (GetAsyncKeyState(VK_LEFT)) {yon+=1; }
if (GetAsyncKeyState(VK_RIGHT)) {yon-=1; }
if (GetAsyncKeyState(VK_SPACE)) {kx=0;ky=0;h=0;}

if (yon<0) yon+=36;
 yn=(int)yon%36;

    putimage((int)kx,(int)ky,rgemim[(yn)],OR_PUT);// GEmimask
    putimage((int)kx,(int)ky,rgemi[(yn)],AND_PUT);// GEmimask
//    putimage((int)kx,(int)ky,rgemi[int(yn)],AND_PUT);// GEmi
    




    swapbuffers();
    delay(10);
}
    return EXIT_SUCCESS;
    closegraph();
}
