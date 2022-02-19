#include <graphics.h> 
int yon=1;
int konumx=50;
void yenikonum(){
    if (konumx<351 && yon==1)  konumx+=5;
    if (konumx==350) yon=0;
    if (konumx>49 && yon==0) konumx-=5;
    if (konumx==50) yon=1;
    }
int main() 
{  
    initwindow(400,300, "4. Nesneleri Çift Arabellekli Sistem ile Hareket Ettirme");   
    swapbuffers(); 
    while(1){
    cleardevice();
    yenikonum();
    setcolor(255);
    circle(konumx,50,20);
    setcolor(COLOR(0,255,0));
    circle(50,150,20);
    swapbuffers(); 
    delay(40);            
    }     
    closegraph();     
    return 0; 
}
