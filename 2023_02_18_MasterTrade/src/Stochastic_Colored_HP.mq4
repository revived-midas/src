//+------------------------------------------------------------------+
//|                                             Color Stochastic.mq4 |
//|                                                           mladen |
//| Stochastic_Color_v1.02clasicB  'classic style'   ki              |
//+------------------------------------------------------------------+
#property copyright "mladen"
#property link      ""

#property indicator_separate_window
#property indicator_buffers   10
#property indicator_minimum   0
#property indicator_maximum 100
#property indicator_color1 DimGray
#property indicator_color2 SlateGray
#property indicator_color3 ForestGreen
#property indicator_color4 Red
#property indicator_color5 Lime
#property indicator_color6 Tomato

#property indicator_style1 STYLE_DOT
#property indicator_width2 2
#property indicator_width3 3
#property indicator_width4 3
#property indicator_width5 3
#property indicator_width6 3

#property indicator_level1  80
#property indicator_level2  50
#property indicator_level3  20
#property indicator_levelcolor DarkSlateGray
#property indicator_levelstyle 2


//---- input parameters
//
//    nice setings for trend = 35,10,1
//
//

extern int       KPeriod       =  14;
extern int       Slowing       =   3;
extern int       DPeriod       =   3;
extern int       MAMethod      =   2;
extern int       PriceField    =   0;
extern int       overBought    =  80;
extern int       overSold      =  20;
extern string    timeFrame     =  "Current TF";
extern string    note_timeFrames = "M1;5,15,30,60|H1;H4;D1;W1;MN||0-CurrentTF";

extern bool      showBars      = false;
extern int       BarsLevel     = 5;    //BarsLevel 0-100
extern int       BarsSize      = 2;    //0-5
extern bool      showArrows    = true;
extern bool      CrossOverBS   = true;
extern bool      CrossContinue = true;
extern color     ArrowUpRevClr = DeepSkyBlue;
extern color     ArrowDnRevClr = LimeGreen;
extern int       ArrowRevSize  =  1;
extern color     ArrowUpClr = Yellow;
extern color     ArrowDnClr = Magenta;
extern int       ArrowSize  = 0;

extern bool      CrossInZone        = true;
extern color     ArrowInZoneUp      = clrWhite;
extern color     ArrowInZoneDn      = clrRed;
extern int       ArrowInZoneSize    = 1;
extern bool      CrossOutZone       = false;
extern color     ArrowOutZoneUp     = clrDodgerBlue;
extern color     ArrowOutZoneDn     = clrOrchid;
extern int       ArrowOutZoneSize   = 1;

extern bool      alertsMessage = true;
extern bool      alertsSound   = false;
extern bool      alertOverBS   = false;
extern bool      alertContinue = false;
extern bool      alertInZone   = true;
extern bool      alertOutZone  = false;
extern bool      alertsEmail   = false;

extern int       AddSigScreans  = 1;
//#define SignalName  ""StochasticSignal" 

//---- buffers
//
//
//
//
//

double   KFull[];
double   DFull[];
double   Upper[];
double   Lower[];
double   Uptrend[];
double   Downtrend[];
double   Buy[];
double   Sell[];
double   CrossInUp[];
double   CrossInDn[];
double   CrossOutUp[];
double   CrossOutDn[];
//
//
//
//
//

int      TimeFrame;
datetime TimeArray[];
int      maxArrows;
int      SignalGap;
string   SignalName;
bool     strend;


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

int init()
{
      IndicatorBuffers(12);
      SetIndexBuffer(0,DFull);
      SetIndexBuffer(1,KFull);
      SetIndexBuffer(2,Upper);
      SetIndexBuffer(3,Lower);
      SetIndexBuffer(4,Uptrend);
      SetIndexBuffer(5,Downtrend);
      SetIndexBuffer(6,CrossInUp);
      SetIndexBuffer(7,CrossInDn);
      SetIndexBuffer(8,CrossOutUp);
      SetIndexBuffer(9,CrossOutDn);
      SetIndexBuffer(10,Buy);
      SetIndexBuffer(11,Sell);
         
         //
         //
         //
         //
         //
         
      if (showBars)
         {      
            SetIndexStyle(0,DRAW_NONE);
            SetIndexStyle(1,DRAW_NONE);
            SetIndexStyle(2,DRAW_ARROW,0,BarsSize);
            SetIndexStyle(3,DRAW_ARROW,0,BarsSize);
            SetIndexStyle(4,DRAW_ARROW,0,BarsSize);
            SetIndexStyle(5,DRAW_ARROW,0,BarsSize);
            SetIndexStyle(6,DRAW_ARROW,0,BarsSize);
            SetIndexStyle(7,DRAW_ARROW,0,BarsSize);
            SetIndexStyle(8,DRAW_ARROW,0,BarsSize);
            SetIndexStyle(9,DRAW_ARROW,0,BarsSize);
     
              SetIndexArrow (2,167);
              SetIndexArrow (3,167);
              SetIndexArrow (4,167);
              SetIndexArrow (5,167);
              SetIndexArrow (6,167);
              SetIndexArrow (7,167);
              SetIndexArrow (8,167);
              SetIndexArrow (9,167);

           
            SetIndexLabel(0,NULL);
            SetIndexLabel(1,NULL);
            SetIndexLabel(2,"Stochastic");
            SetIndexLabel(3,"Stochastic");
            SetIndexLabel(4,"Stochastic");
            SetIndexLabel(5,"Stochastic");
            SetIndexLabel(6,"Stochastic");
            SetIndexLabel(7,"Stochastic");
            SetIndexLabel(8,"Stochastic");
            SetIndexLabel(9,"Stochastic");
         }                  
      else
         {
            SetIndexLabel(0,"Stochastic");
            SetIndexLabel(1,"Stochastic");
            SetIndexLabel(2,NULL);
            SetIndexLabel(3,NULL);
            SetIndexLabel(4,NULL);
            SetIndexLabel(5,NULL);
            SetIndexLabel(6,NULL);
            SetIndexLabel(7,NULL);
            SetIndexLabel(8,NULL);
            SetIndexLabel(9,NULL);
            SetIndexStyle(0,DRAW_LINE);
            SetIndexStyle(1,DRAW_LINE);
            SetIndexStyle(2,DRAW_LINE);
            SetIndexStyle(3,DRAW_LINE);
            SetIndexStyle(4,DRAW_NONE);
            SetIndexStyle(5,DRAW_NONE);
            SetIndexStyle(6,DRAW_NONE);
            SetIndexStyle(7,DRAW_NONE);
            SetIndexStyle(8,DRAW_NONE);
            SetIndexStyle(9,DRAW_NONE);
           
            DPeriod = MathMax(DPeriod,1);
            if (DPeriod==1) {
                  SetIndexStyle(0,DRAW_NONE);
                  SetIndexLabel(0,NULL);
               }
            else {
                  SetIndexStyle(0,DRAW_LINE); 
                  SetIndexLabel(0,"Signal");
               }               
         }
              
         //
         //
         //
         //
         //
         
   TimeFrame        =stringToTimeFrame(timeFrame);
   string shortName = "Stochastic ("+TimeFrameToString(TimeFrame)+","+KPeriod+","+Slowing+","+DPeriod+","+maDescription(MAMethod)+","+priceDescription(PriceField);

         if (overBought < overSold) overBought = overSold;
         if (overBought < 100)      shortName  = shortName+","+overBought;
         if (overSold   >   0)      shortName  = shortName+","+overSold;
   IndicatorShortName(shortName+")");

SignalName=MakeUniqueName("Stoch102 #"," (" +KPeriod+","+Slowing+","+DPeriod+") ["+TimeFrameToString(TimeFrame)+"]");
//SignalName=MakeUniqueName("Stoch102 #", shortName);
 
   return(0);
}

//
//
//
//
//

int deinit()
{
   ObjectsDeleteAll(0,SignalName);
   DeleteArrows();
   return(0);
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+

int start()
{
   int    counted_bars=IndicatorCounted();
   int    limit;
   int    i,y;
   bool   outZone;
   

   
   if(counted_bars<0) return(-1);
         limit=MathMax(Bars-counted_bars,TimeFrame/Period());
         ArrayCopySeries(TimeArray ,MODE_TIME ,NULL,TimeFrame);
            
      
   //
   //
   //
   //
   //
   
   for(i=0,y=0; i<limit; i++)
      {
         if(Time[i]<TimeArray[y]) y++;
            KFull[i] = iStochastic(NULL,TimeFrame,KPeriod,DPeriod,Slowing,MAMethod,PriceField,MODE_MAIN,y);
            DFull[i] = iStochastic(NULL,TimeFrame,KPeriod,DPeriod,Slowing,MAMethod,PriceField,MODE_SIGNAL,y);
      }
   for(i=limit,y=0; i>=0; i--)
      {
         if (showBars)
            {
               Upper[i]     = EMPTY_VALUE;
               Lower[i]     = EMPTY_VALUE;
               while(true)
                  {
                     if (KFull[i] > overBought) { Upper[i]     = BarsLevel; break;}
                     if (KFull[i] < overSold)   { Lower[i]     = BarsLevel; break;}
                     if (KFull[i] > KFull[i+1]) { Uptrend[i]   = BarsLevel; break;}
                     if (KFull[i] < KFull[i+1]) { Downtrend[i] = BarsLevel; break;}
                        Uptrend[i]   = Uptrend[i+1];
                        Downtrend[i] = Downtrend[i+1];
                     break;
                  }
            }
         else
            {
               CrossInUp[i] = -1;
               CrossInDn[i] = -1;
               CrossOutUp[i] = -1;
               CrossOutDn[i] = -1;
               
               if (KFull[i] > overBought) { Upper[i] = KFull[i]; Upper[i+1] = KFull[i+1]; }
               else                       { Upper[i] = EMPTY_VALUE;
                                            if (Upper[i+2] == EMPTY_VALUE)
                                                Upper[i+1]  = EMPTY_VALUE; }
               if (KFull[i] < overSold)   { Lower[i] = KFull[i]; Lower[i+1] = KFull[i+1]; }
               else                       { Lower[i] = EMPTY_VALUE;
                                            if (Lower[i+2] == EMPTY_VALUE)
                                                Lower[i+1]  = EMPTY_VALUE; }
            
                  
                  outZone = (KFull[i]<=overBought && KFull[i+1]<=overBought && DFull[i]<=overBought && DFull[i+1]<=overBought &&
                             KFull[i]>=overSold && KFull[i+1]>=overSold && DFull[i]>=overSold && DFull[i+1]>=overSold);
                  
                  if(KFull[i]>DFull[i] && KFull[i+1]<=DFull[i+1] && KFull[i]<=overSold && KFull[i+1]<=overSold && DFull[i]<=overSold && DFull[i+1]<=overSold)
                     CrossInUp[i] = 1;
                  if(KFull[i]<DFull[i] && KFull[i+1]>=DFull[i+1] && KFull[i]>=overBought && KFull[i+1]>=overBought && DFull[i]>=overBought && DFull[i+1]>=overBought)
                     CrossInDn[i] = 1;                  
                  
                  if(KFull[i]>DFull[i] && KFull[i+1]<=DFull[i+1] && outZone)
                     CrossOutUp[i] = 1;
                  if(KFull[i]<DFull[i] && KFull[i+1]>=DFull[i+1] && outZone)
                     CrossOutDn[i] = 1;
            }                                                
      }                                             

   //
   //
   //
   //
   //

   DeleteArrows();
   if (showArrows)
      {
         if  (AddSigScreans<=0) AddSigScreans=1;

         SignalGap = MathCeil(iATR(NULL,0,50,0)/Point);
         for (i=0; i<WindowBarsPerChart()* AddSigScreans;i++)
            {
               if (CrossOverBS   && KFull[i]<overBought && KFull[i+1]>overBought) DrawArrow(i,"dnRev");
               if (CrossContinue && KFull[i]>overBought && KFull[i+1]<overBought) DrawArrow(i,"up");
     
               if (CrossOverBS   && KFull[i]>overSold   && KFull[i+1]<overSold)   DrawArrow(i,"upRev");
               if (CrossContinue && KFull[i]<overSold   && KFull[i+1]>overSold)   DrawArrow(i,"down");

               if (CrossInZone && CrossInUp[i]==1.0) DrawArrow(i,"inUp");
               if (CrossInZone && CrossInDn[i]==1.0) DrawArrow(i,"inDn");
               if (CrossOutZone && CrossOutUp[i]==1.0) DrawArrow(i,"outUp");
               if (CrossOutZone && CrossOutDn[i]==1.0) DrawArrow(i,"outDn");
            }
      }            
   // (alertsOn)
   // strend false = down true = up   
   if (alertOverBS)
     {
        if (KFull[0]<overBought && KFull[1]>overBought) 
            {
             doAlert(overBought+" StochOverBought;ReverseDn");
             strend = false;
            }
        if (KFull[0]>overSold   && KFull[1]<overSold)  
           {
            doAlert(overSold+" StochOversold;ReverseUp");
            strend = true;
           }
     }
   if (alertContinue)
     {
        if (KFull[0]>overBought && KFull[1]<overBought) 
           {
            doAlert(overBought+" StochOverBought;ContinueUp");
            strend = true;
           }
        if (KFull[0]<overSold   && KFull[1]>overSold)   
           {
            doAlert(overSold+"StochOversold;ContinueDn");
            strend = false;
           }
       }
   if (alertInZone)
     {
        if (CrossInUp[0]==1.0) 
           {
            doAlert("Stochastic K/D Cross Up; Inzone");
            strend = true;
           }
        if (CrossInDn[0]==1.0)   
           {
            doAlert("Stochastic K/D Cross Dn; Inzone");
            strend = false;
           }
       }
   if (alertOutZone)
     {
        if (CrossOutUp[0]==1.0) 
           {
            doAlert("Stochastic K/D Cross Up; OutZone");
            strend = true;
           }
        if (CrossOutDn[0]==1.0)   
           {
            doAlert("Stochastic K/D Cross Dn; OutZone");
            strend = false;
           }
       }
   //
   //
   //
   //
   //
 
   return(0);
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//
//
//
//

string MakeUniqueName(string first, string rest)
{
   string result = first+(MathRand()%1001)+rest;

      while (WindowFind(result)>= 0)
             result = first+(MathRand()%1001)+rest;
   return(result);
}


//
//
//
//

void DrawArrow(int i,string type)
{
   Buy[i]=EMPTY_VALUE;
   Sell[i]=EMPTY_VALUE;
   maxArrows++;
      string name = StringConcatenate(SignalName,maxArrows);
         
      ObjectCreate(name,OBJ_ARROW,0,Time[i],0);
      if (type=="down")
         {
            ObjectSet(name,OBJPROP_PRICE1,High[i]+(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,242);
            ObjectSet(name,OBJPROP_COLOR,ArrowDnClr);
            ObjectSet(name,OBJPROP_WIDTH,ArrowSize);
            Sell[i]=1;
         }
      if (type=="dnRev")
         {
            ObjectSet(name,OBJPROP_PRICE1,High[i]+(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,242);
            ObjectSet(name,OBJPROP_COLOR,ArrowDnRevClr);
            ObjectSet(name,OBJPROP_WIDTH,ArrowRevSize);
            Sell[i]=1;
         }
      if (type=="inDn")
         {
            ObjectSet(name,OBJPROP_PRICE1,High[i]+(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,242);
            ObjectSet(name,OBJPROP_COLOR,ArrowInZoneDn);
            ObjectSet(name,OBJPROP_WIDTH,ArrowInZoneSize);
            Sell[i]=1;
         }
      if (type=="outDn")
         {
            ObjectSet(name,OBJPROP_PRICE1,High[i]+(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,242);
            ObjectSet(name,OBJPROP_COLOR,ArrowOutZoneDn);
            ObjectSet(name,OBJPROP_WIDTH,ArrowOutZoneSize);
            Sell[i]=1;
         }

      if (type=="up")
    
         {
            ObjectSet(name,OBJPROP_PRICE1,Low[i]-(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,241);
            ObjectSet(name,OBJPROP_COLOR,ArrowUpClr);
            ObjectSet(name,OBJPROP_WIDTH,ArrowSize);
            Buy[i]=1;
         }
      if (type=="upRev")
    
         {
            ObjectSet(name,OBJPROP_PRICE1,Low[i]-(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,241);
            ObjectSet(name,OBJPROP_COLOR,ArrowUpRevClr);
            ObjectSet(name,OBJPROP_WIDTH,ArrowRevSize);
            Buy[i]=1;
         }
      if (type=="inUp")
         {
            ObjectSet(name,OBJPROP_PRICE1,Low[i]-(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,241);
            ObjectSet(name,OBJPROP_COLOR,ArrowInZoneUp);
            ObjectSet(name,OBJPROP_WIDTH,ArrowInZoneSize);
            Sell[i]=1;
         }
      if (type=="outUp")
         {
            ObjectSet(name,OBJPROP_PRICE1,Low[i]-(SignalGap*Point));
            ObjectSet(name,OBJPROP_ARROWCODE,241);
            ObjectSet(name,OBJPROP_COLOR,ArrowOutZoneUp);
            ObjectSet(name,OBJPROP_WIDTH,ArrowOutZoneSize);
            Sell[i]=1;
         }
}
void DeleteArrows()
{
   ObjectsDeleteAll(0,SignalName);
   while(maxArrows>0) { ObjectDelete(StringConcatenate(SignalName,maxArrows)); maxArrows--; }
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

void doAlert(string doWhat)
{
   static string   previousAlert="nothing";
   static datetime previousTime;
   string message;
   
      if (previousAlert != doWhat || previousTime != Time[0]) {
          previousAlert  = doWhat;
          previousTime   = Time[0];
      
          //
          //
          //
          //
          //
            
          message =  StringConcatenate(Symbol()," Stochastic Crossing");
             if (alertsMessage) Alert(message);
             if (alertsSound)  
             // strend false = down true = up
                PlaySound("alert2.wav");
             if (alertsEmail)   SendMail(StringConcatenate(Symbol()," Stochastic crossing"),message);
      }        
}


//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

string priceDescription(int mode)
{
   string answer;
   switch(mode)
   {
      case 0:  answer = "Low/High"    ; break; 
      case 1:  answer = "Close/Close" ; break;
      default: answer = "Invalid price field requested";
                                    Alert(answer);
   }
   return(answer);
}
string maDescription(int mode)
{
   string answer;
   switch(mode)
   {
      case MODE_SMA:  answer = "SMA"  ; break; 
      case MODE_EMA:  answer = "EMA"  ; break;
      case MODE_SMMA: answer = "SMMA" ; break;
      case MODE_LWMA: answer = "LWMA" ; break;
      default:        answer = "Invalid MA mode requested";
                                    Alert(answer);
   }
   return(answer);
}
int stringToTimeFrame(string tfs)
{
   int tf=0;
       tfs = StringUpperCase(tfs);
         if (tfs=="M1" || tfs=="1M"   || tfs=="1"  )                tf=PERIOD_M1 ;
         if (tfs=="M5" || tfs=="5M"   || tfs=="5"  )                tf=PERIOD_M5 ;
         if (tfs=="M15"|| tfs=="15M"  || tfs=="15" )                tf=PERIOD_M15;
         if (tfs=="M30"|| tfs=="30M"  || tfs=="30" )                tf=PERIOD_M30;
         if (tfs=="H1" || tfs=="1H"   || tfs=="60" )                tf=PERIOD_H1 ;
         if (tfs=="H4" || tfs=="4H"   || tfs=="240")                tf=PERIOD_H4 ;
         if (tfs=="D1" || tfs=="1D"   || tfs=="D" || tfs=="1440")   tf=PERIOD_D1 ;
         if (tfs=="W1" || tfs=="10080"|| tfs=="1W"|| tfs=="W")      tf=PERIOD_W1 ;
         if (tfs=="MN" || tfs=="43200") tf=PERIOD_MN1;
         if (tf<Period()) tf=Period();
  return(tf);
}
string TimeFrameToString(int tf)
{
   string tfs="CurrentTF";
   switch(tf) {
      case PERIOD_M1:  tfs="M1"  ; break;
      case PERIOD_M5:  tfs="M5"  ; break;
      case PERIOD_M15: tfs="M15" ; break;
      case PERIOD_M30: tfs="M30" ; break;
      case PERIOD_H1:  tfs="H1"  ; break;
      case PERIOD_H4:  tfs="H4"  ; break;
      case PERIOD_D1:  tfs="D1"  ; break;
      case PERIOD_W1:  tfs="W1"  ; break;
      case PERIOD_MN1: tfs="MN1";
   }
   return(tfs);
}

//
//
//
//
//

string StringUpperCase(string str)
{
   string   s = str;
   int      lenght = StringLen(str) - 1;
   int      tchar;
   
   while(lenght >= 0)
      {
         tchar = StringGetChar(s, lenght);
         
         //
         //
         //
         //
         //
         
         if((tchar > 96 && tchar < 123) || (tchar > 223 && tchar < 256))
                  s = StringSetChar(s, lenght, tchar - 32);
          else 
              if(tchar > -33 && tchar < 0)
                  s = StringSetChar(s, lenght, tchar + 224);
         lenght--;
   }
   
   //
   //
   //
   //
   //
   
   return(s);
}