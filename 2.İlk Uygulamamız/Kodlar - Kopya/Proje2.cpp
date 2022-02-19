
#include <graphics.h> 
int main() 
{  
   void *yildiz;
   void *mavi;
    initwindow(700,700, "2. Ýlk Penceremiz");
    setlinestyle(0,0,2);
    swapbuffers();
    readimagefile("gunes.bmp",0,0,127,127);
    yildiz=malloc(imagesize(0 ,0,127,127));
    getimage(0,0,127,127, yildiz);

    readimagefile("mavi.bmp",0,0,127,127);
    mavi=malloc(imagesize(0 ,0,127,127));
    getimage(0,0,127,127, mavi);
    //setgraphmode(0);
    int z=0;
    while(1){
             cleardevice();
             putimage(100-z,z,mavi,1||2); // yýldýz
  //           putimage(100-z,z,mavi,AND_PUT); // yýldýz
             
             
             putimage(z,z,yildiz,1||2); // yýldýz 
             z++;
             swapbuffers();
             delay(40);
             }
    closegraph();
    return 0; 
}
