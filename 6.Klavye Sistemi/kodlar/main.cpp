#include <graphics.h>
#include <stdio.h>
int main(int argc, char *argv[])
{
initwindow(400,400,"6. Klavye Kontrolleri",0,0);
int kx=175;
int ky=175;
while(1){
cleardevice();

// Klavye Kodlarý
if (GetAsyncKeyState(VK_UP))    ky-=5;
if (GetAsyncKeyState(VK_DOWN))  ky+=5;
if (GetAsyncKeyState(VK_LEFT))  kx-=5;
if (GetAsyncKeyState(VK_RIGHT)) kx+=5;
if (GetAsyncKeyState(VK_SPACE)) {kx=175;ky=175;}
// Animasyon Kodlarý
if (kx<0) kx=350;
if (kx>350) kx=0;
if (ky<0) ky=350;
if (ky>350) ky=0;
// Çizim Kodlarý
outtextxy(75,150, "Ok Tuþlarýný Kullanarak Hareket Ettirin");
line(kx+25,0,kx+25,ky);   line(kx+25,400,kx+25,ky+50);
line(0,ky+25, kx,ky+25);  line(400,ky+25, kx+50,ky+25); 
rectangle(kx,ky,kx+50,ky+50);
// Arabellek Deðiþimi ve Bekleme Kodu
swapbuffers();
delay(40);
}
    return EXIT_SUCCESS;
    closegraph();
}
