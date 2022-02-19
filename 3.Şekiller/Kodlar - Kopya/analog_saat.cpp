#include<graphics.h>
#include<math.h>
#include<stdio.h>
int main()
{ 
    initwindow(500,500,"Analog Saat"); //Grafik penceresi actým
    int n[9]={0,1,45,23,56,23,78,34};
    
    drawpoly(3, &n);
    system("PAUSE");    
    closegraph();             

}
