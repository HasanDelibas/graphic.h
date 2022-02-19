#include <graphics.h> 
int main() 
{  
    int r=0;         // Renk 1
    int k=0;         // Renk 2
    int x=0;         // X kordinatý
    initwindow(300,300, "asda",0,0 ,true); 
    setcolor(255);
    setfillstyle( 4, COLOR(255,255,0) );
    circle(50,50,23);
    swapbuffers();
    while(!kbhit());
    closegraph();
    return 0;
}
