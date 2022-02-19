#include<graphics.h>
#include<math.h>
#include<stdio.h>
int main()
{
   
    printf("Analog saat uygulamasini baslatmak icin 1e basiniz: ");
    int a;
    scanf("%d",&a);
    if(a==1){ 
    
    initwindow(500,500,"Analog Saat"); //Grafik penceresi actým
    circle(250,250,100);        //  Saatimin dis kalýbýný cýzdýrdým
    line(250,150,250,175);     // 12,3,6,9 içn cizgiler
    line(350,250,325,250);
    line(250,350,250,325);
    line(150,250,175,250);
    outtextxy(20,20,"Analog Saat Similasyonu");
    outtextxy(243,175,"12");
    outtextxy(320,243,"3");
    outtextxy(175,243,"9");
    outtextxy(247,325,"6");
    for(int i=5;i>=0;i--){
            setcolor(YELLOW);  // saatimin tam ortasýna sarý bý nokta yerlestýrdým
            circle(250,250,i);
            }
    
   for(int j=0;j<=360;j=j+6){      
            double a=250.00+40.00*-sin(j);
            double b=250.00+40.00*-cos(j); // Saat kýsmý 
                    // bekletme 
            
   for(double i=0;i<=360;i=i+6){
            double x=250.00+60.00*-sin(i);
            double y=250.00+60.00*-cos(i);
             setcolor(WHITE); // yelkovan hareketi
            line(250,250,x,y);
            setcolor(RED);
            line(250,250,a,b);
          
            
            
          
         delay(1000);
            setcolor(BLACK);  // bunu yapmamýn nedený harelet edýyoermus gibi gostermek
            line(250,250,x,y);
            }
            
            }
            
            }// if
            else
            printf("Hatali Giris!\n");
          
    system("PAUSE");
}
