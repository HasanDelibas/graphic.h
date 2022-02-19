#include <graphics.h>
#include <stdio.h>
 
int main() 
{  
    initwindow(400,300, "Arc : Yay");
    setbkcolor(15);
    cleardevice();
    /*
    for (int i = 0 ;i<90;i++){
    setcolor(COLOR(255,0,0));
    arc(200,150,135-i/2, 315+i/2,i+50);
     }
     */
    
    setcolor(COLOR(255,0,0));
    int i;
    while(1){
    scanf("%d",&i);
    cleardevice();
    for (i;i<90;i+=3){ 
     ellipse(200-10+i/9,150,90-i/3,270+i/2,60+i/3,90);
     }
     }
    closegraph();
    return 0; 
 } 
