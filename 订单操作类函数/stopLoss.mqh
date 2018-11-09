//+------------------------------------------------------------------+
//|                                                     stopLoss.mqh |
//|       Copyright 2018,DollarKiller DollarKiller@dollarKiller.com. |
//|                                         https://dollarkiller.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018,DollarKiller DollarKiller@dollarKiller.com."
#property link      "https://dollarkiller.com"
#property strict

//+------------------------------------------------------------------+
//|            止损相关
//|   buy单 固定价格止损  buyGD(订单识别码,间隔)
//|   自动Buy单追踪止损   buyZuiZong(订单识别码,间隔)  
//|   Buy平保加跟踪止损   buyZuiZongPingbao(订单识别码,间隔)
//|   自动Sell单追踪止损  sellZuiZong(订单识别码,间隔)
//|
//|                                                            
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|  buy固定止损间隔 或者  阶梯止损间隔                                                                
//+------------------------------------------------------------------+
void buyGD(int magic,double jiange)
  {
   int total=OrdersTotal();
   double cls[][2];//存储前一个止损值
   ArrayResize(cls,total,total);

   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY && OrderMagicNumber()==magic && OrderSymbol()==Symbol())
           {
            cls[i][0]=OrderStopLoss();//存储当前止损价格

            if(Ask-jiange*Point>=cls[i][0]+jiange+Point)
              {
               if(!OrderModify(OrderTicket(),OrderOpenPrice(),Ask-jiange*Point,OrderTakeProfit(),0,clrAliceBlue))
                 {
                  printf("移动止损失败!请查询错误代码:"+(string)GetLastError());
                 }
              }
           }
        }

     }
  }
//+------------------------------------------------------------------+
//|       自动Buy单追踪止损                                                           
//+------------------------------------------------------------------+
void buyZuiZong(int magic,double jiange)
  {
   int total=OrdersTotal();
   double cls[][2];//存储前一个止损值
   ArrayResize(cls,total,total);

   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY && OrderMagicNumber()==magic && OrderSymbol()==Symbol())
           {
            cls[i][0]=OrderStopLoss();//存储当前止损价格

            if(Ask-jiange*Point>cls[i][0])
              {
               if(!OrderModify(OrderTicket(),OrderOpenPrice(),Ask-jiange*Point,OrderTakeProfit(),0,clrAliceBlue))
                 {
                  printf("移动止损失败!请查询错误代码:"+(string)GetLastError());
                 }
              }
           }
        }

     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Buy平保加跟踪止损                                                        |
//+------------------------------------------------------------------+
void buyZuiZongPingbao(int magic,double jiange)
  {
   int total=OrdersTotal();
   double setNum[][2];
   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY && OrderSymbol()==Symbol() && OrderMagicNumber()==magic)
           {
            setNum[i][0]=OrderStopLoss();//止损价格
            setNum[i][1]=OrderOpenPrice();//开仓价格
            if(Ask-jiange*Point>setNum[i][1] && Ask-jiange*Point>setNum[i][0])//平保加更正止损
              {
               if(!OrderModify(OrderTicket(),OrderOpenPrice(),Ask-jiange*Point,OrderTakeProfit(),0,clrBisque))
                 {
                  printf("移动止损失败！请查询错误代码："+(string)GetLastError());
                 }
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|       自动Sell单追踪止损                                                           
//+------------------------------------------------------------------+
void sellZuiZong(int magic,double jiange)
  {
   int total=OrdersTotal();
   double cls[][2];//存储前一个止损值
   ArrayResize(cls,total,total);

   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_SELL && OrderMagicNumber()==magic && OrderSymbol()==Symbol())
           {
            cls[i][0]=OrderStopLoss();//存储当前止损价格

            if(Ask+jiange*Point<cls[i][0])
              {
               if(!OrderModify(OrderTicket(),OrderOpenPrice(),Ask+jiange*Point,OrderTakeProfit(),0,clrAliceBlue))
                 {
                  printf("移动止损失败!请查询错误代码:"+(string)GetLastError());
                 }
              }
           }
        } 

     }
  }
