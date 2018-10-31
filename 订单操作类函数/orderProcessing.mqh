//+------------------------------------------------------------------+
//|                                              orderProcessing.mqh |
//|       Copyright 2018,DollarKiller DollarKiller@dollarKiller.com. |
//|                                         https://dollarkiller.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018,DollarKiller DollarKiller@dollarKiller.com."
#property link      "https://dollarkiller.com"
#property strict
//+------------------------------------------------------------------+
//|                 订单处理相关
//|     一键删除挂单allGua()    一键获取挂单量allOrderGua() 返回int
//|     修改buy单止盈止损buySet(止损,止盈)
//|     修改sell单止盈止损sellSet(止损,止盈)    
//|     一键全平allPing()     
//|     一键平多单buyPing()     一键平空单 sellPing()                                                     
//|     获取当前订单数allOrder()
//|     获取多单订单数 buyOrder()  获取空单订单数sellOrder()
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|  一键删除挂单                                                                
//+------------------------------------------------------------------+
void allGua()
  {
   while(allOrderGua()>0)
     {
      int total= OrdersTotal();
      for(int i=total-1;i>=0;i--)
        {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            if(OrderType()>1 && OrderType()<6)
              {
               if(!OrderDelete(OrderTicket(),clrAqua))
                 {
                  Alert("挂单删除失败!请查询错误代码:"+(string)GetLastError());
                 }
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|    一件获取挂单                                                              |
//+------------------------------------------------------------------+

int allOrderGua()
  {
   int num=0;
   int total=OrdersTotal();
   for(int i=total-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUYLIMIT || OrderType()==OP_BUYSTOP || OrderType()==OP_SELLLIMIT || OrderType()==OP_SELLSTOP)
           {
            num++;
           }
        }
     }

   return(num);
  }
//+------------------------------------------------------------------+
//|   修改Buy单止盈止损                                                               |
//+------------------------------------------------------------------+
void buySet(double stoplosss,double takeprofits)
  {
   int total=OrdersTotal();
   for(int i=total-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY)
           {
            if(!OrderModify(OrderTicket(),OrderOpenPrice(),Bid-stoplosss*Point,Bid+takeprofits*Point,0,clrRosyBrown))
              {
               Alert("修改订单失败!请查询错误代码:"+(string)GetLastError());
              }
           }
        }
     }

  }
//+------------------------------------------------------------------+
//|     修改Sell单止盈止损                                                             |
//+------------------------------------------------------------------+
void sellSet(double stoplosss,double takeprofits)
  {
   int total= OrdersTotal();
   for(int i=total-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_SELL)
           {
            if(!OrderModify(OrderTicket(),OrderOpenPrice(),Ask+stoplosss*Point,Ask-stoplosss*Point,0,clrAntiqueWhite))
              {
               Alert("修改订单失败!请查询错误代码:"+(string)GetLastError());
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|                 一键全平                              |
//+------------------------------------------------------------------+
//正序
/*void allPing()
  {
   while(allOrder()>0)
     {
      for(int i=0;i<OrdersTotal();i++)
        {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            if(OrderType()<=1)
              {
               bool s=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),0,clrAquamarine);
              }
           }
        }
     }

  }*/
//倒序号
void allPing()
  {
   while(allOrder()>0)
     {
      int t=OrdersTotal();//<==========================倒序号
      for(int i=t-1;i>=0;i--)
        {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            if(OrderType()<=1)
              {
               bool s=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),0,clrAquamarine);
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|   一键平多单                                                               
//+------------------------------------------------------------------+
void buyPing()
  {
   while(buyOrder()>0)
     {
      int total= OrdersTotal();
      for(int i=total-1;i>=0;i--)//倒序
        {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            if(OrderType()==0)
              {
               bool ping=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),0,clrAqua);
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|   一键平空单                                                               
//+------------------------------------------------------------------+
void sellPing()
  {
   while(sellOrder()>0)
     {
      int total= OrdersTotal();
      for(int i=total-1;i>=0;i--)//倒序
        {
         if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
           {
            if(OrderType()==1)
              {
               bool ping=OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),0,clrAqua);
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
//|   获取buy and sell单个数                                                               
//+------------------------------------------------------------------+
int allOrder()
  {
   int a=0;
   int total=OrdersTotal();
   for(int i=total-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY || OrderType()==OP_SELL)
           {
            a++;
           }
        }
     }
   return(a);
  }
//+------------------------------------------------------------------+
//|       获取buy单个数                                                          
//+------------------------------------------------------------------+

int buyOrder()
  {
   int a=0;
   int total=OrdersTotal();
   for(int i=total-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_BUY)
           {
            a++;
           }
        }
     }
   return(a);
  }
//+------------------------------------------------------------------+
//|    获取sell单个数                              
//+------------------------------------------------------------------+

int sellOrder()
  {
   int a=0;
   int total=OrdersTotal();
   for(int i=total-1;i>=0;i--)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderType()==OP_SELL)
           {
            a++;
           }
        }
     }
   return(a);
  }
//+------------------------------------------------------------------+


