#include <graphics.h> 
int main() 
{  
    initwindow(400,400, "5. Resim Ekleme");
    readimagefile("resimler\\gunes.bmp",120,20,200,80);
    line(120,0,120,400);
    line(200,0,200,400);
    line(0,20,400,20);
    line(0,80,400,80);
    while(1);
    closegraph();
    return 0; 
}
