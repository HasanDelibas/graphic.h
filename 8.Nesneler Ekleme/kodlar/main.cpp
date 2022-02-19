#include <graphics.h>
#include <iostream.>
#include <math.h>
using namespace std;

typedef struct TOP1{
       double X,Y;
       double dX,dY;
       int renk;
       }TOP;
TOP top[16];


bool uzunluk(double x1,double y1,double x2, double y2,int u,int i){
    if ( u*u > ((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2))){
         double oran = u*u / ((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
         top[i].X=x2+ (x1-x2)*oran;
         top[i].Y=y2+ (y1-y2)*oran;         
         return true;} else {  return false;}
}



void cizim(TOP top[]){
     for (int i =0;i<16;i++){
     setcolor(top[i].renk);
     setfillstyle(1,top[i].renk);
     circle((int)top[i].X,(int)top[i].Y,10);
     floodfill( (int)top[i].X,(int)top[i].Y, top[i].renk );
     }
}
void carp(TOP top[]){
     double temp;
     for (int i =0;i<16;i++){
         for ( int j=i+1;j<16;j++){
             int d = uzunluk(top[i].X,top[i].Y,top[j].X,top[j].Y,20,i);
             if  (d){
             double temp;
             double thizx= top[i].dX+top[j].dX;
             double thizy= top[i].dY+top[j].dY;
             if (thizx>0 && top[i].X>top[j].X){
                         top[i].dX
                         
                         } 
             
             temp=top[j].dX;top[j].dX=top[i].dX;top[i].dX=temp;
             temp=top[j].dY;top[j].dY=top[i].dY;top[i].dY=temp;             
             
             }
         }    
     }   
}



void ani(TOP top[]){
     for (int i =0;i<16;i++){
         top[i].X+=top[i].dX;
         top[i].Y+=top[i].dY;
         
     if  (top[i].Y > 500){ top[i].dY=-top[i].dY;    top[i].Y=500;}
     if  (top[i].Y < 100){ top[i].dY=-top[i].dY;    top[i].Y=100;}
     if  (top[i].X > 700){ top[i].dX=-top[i].dX;    top[i].X=700;}
     if  (top[i].X < 100){ top[i].dX=-top[i].dX;    top[i].X=100;}                  
     }
}



int main(int argc, char *argv[]){

initwindow(800,600,"9. Nesneler");
cout << "kjk";

  int i=0;
for (double x=0; x<5;x++){
   for (double y=0;y<=x;y++){
    top[i].X=x*30 +500; top[i].Y=(y-x/2)*30+300; top[i].renk=i;
    top[i].dX=0;
    top[i].dY=0;    
    i++;       
    }
}
top[4].renk=0;top[0].renk=4;
top[i].X=130; top[i].Y=300; top[i].renk=15; top[i].dX=5; top[i].dY=0;

setbkcolor(COLOR(0,255,0));
while(1){
cleardevice();

rectangle(90,90,710,510);
ani(top);
carp(top);
cizim(top);

swapbuffers(); 
delay(0);   
}

return EXIT_SUCCESS;
closegraph();

}
