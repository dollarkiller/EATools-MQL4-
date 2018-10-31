//+------------------------------------------------------------------+
//|                                                       orders.mql |
//|Copyright 2018,DollarKiller外汇研究院 DollarKiller@dollarKiller.com. |
//|                                         https://dollarkiller.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018,DollarKiller外汇研究院 DollarKiller@dollarKiller.com."
#property link      "https://dollarkiller.com"
//+------------------------------------------------------------------+
//|                     这是一个订单操作类的模块
//|       返回值bool    
//|       sell() 做空  buy()做多      
//|       实例:sell(手数,止损,止盈,注释,订单识别码)
//|       
//|       sendBuyLimit()挂单limit多
//|       sendSellLimit()挂单limit空
//|       sendBuyLimit(开仓价格,手数,止损,止盈,注释,订单识别码,时间)
//|
//|                
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                       sell函数                                      
//+------------------------------------------------------------------+
bool sell(double lots,double zhisun,double zhiying,string zhushi,int mag)
  {
   bool Return=false;
   bool setS = false;
   int total = OrdersTotal();
   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderComment()==zhushi && OrderMagicNumber()==mag)
           {
            Return=true;
            break;
           }
        }
     }
   if(!Return)
     {
      ResetLastError();
      //两个都要设置
      if(zhisun!=0 && zhiying!=0)
        {
         setS=OrderSend(Symbol(),OP_SELL,lots,Bid,20,Ask+zhisun*Point,Ask-zhiying*Point,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //当不设置止损
      if(zhisun==0 && zhiying!=0)
        {
         setS=OrderSend(Symbol(),OP_SELL,lots,Bid,20,0,Ask-zhiying*Point,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //当不设置止盈
      if(zhisun!=0 && zhiying==0)
        {
         setS=OrderSend(Symbol(),OP_SELL,lots,Bid,20,Ask+zhisun*Point,0,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //直接开单
      if(zhisun==0 && zhiying==0)
        {
         setS=OrderSend(Symbol(),OP_SELL,lots,Bid,20,0,0,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }

     }
   return Return;
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                    Buy函数                                    |
//+------------------------------------------------------------------+

bool buy(double lots,double zhisun,double zhiying,string zhushi,int mag)
  {
   bool Return=false;
   bool setS = false;
   int total = OrdersTotal();
   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderComment()==zhushi && OrderMagicNumber()==mag)
           {
            Return=true;
            break;
           }
        }
     }
   if(!Return)
     {
      ResetLastError();
      //两个都要设置
      if(zhisun!=0 && zhiying!=0)
        {
         setS=OrderSend(Symbol(),OP_BUY,lots,Ask,20,Bid-zhisun*Point,Bid+zhiying*Point,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //当不设置止损
      if(zhisun==0 && zhiying!=0)
        {
         setS=OrderSend(Symbol(),OP_BUY,lots,Ask,20,0,Bid+zhiying*Point,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //当不设置止盈
      if(zhisun!=0 && zhiying==0)
        {
         setS=OrderSend(Symbol(),OP_BUY,lots,Ask,20,Bid-zhisun*Point,0,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //直接开单
      if(zhisun==0 && zhiying==0)
        {
         setS=OrderSend(Symbol(),OP_BUY,lots,Ask,20,0,0,zhushi,mag,0,clrMediumSeaGreen);
         if(!setS)
           {
            printf("开单失败！请查询错误代码:"+(string)GetLastError());
           }
        }

     }
   return Return;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|               挂单买                                             |
//+------------------------------------------------------------------+
bool sendBuyLimit(double prices,double lots,double zhisun,double zhiying,string zhushi,int mag,datetime time)
  {
   bool Return=false;
   bool sedS = false;
   int total = OrdersTotal();
   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderSymbol()==Symbol() && OrderType()==OP_BUYLIMIT && OrderComment()==zhushi && OrderMagicNumber()==mag)
           {
            Return=true;
            break;
           }
        }
     }
   if(!Return)
     {
      ResetLastError();
      //止损止盈
      if(zhisun!=0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,Bid-zhisun*Point,Bid+zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设止盈
      if(zhisun==0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,0,Bid+zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设质止损
      if(zhisun!=0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,Bid-zhisun*Point,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //止损止盈都不设置
      if(zhisun==0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,0,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
     }
   return sedS;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|           挂单sell                                                       |
//+------------------------------------------------------------------+
bool sendSellLimit(double prices,double lots,double zhisun,double zhiying,string zhushi,int mag,datetime time)
  {
   bool Return=false;
   bool sedS = false;
   int total = OrdersTotal();
   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderSymbol()==Symbol() && OrderType()==OP_SELLLIMIT && OrderComment()==zhushi && OrderMagicNumber()==mag)
           {
            Return=true;
            break;
           }
        }
     }
   if(!Return)
     {
      ResetLastError();
      //止损止盈
      if(zhisun!=0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,Ask+zhisun*Point,Ask-zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设止盈
      if(zhisun==0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,0,Ask-zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设质止损
      if(zhisun!=0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,Ask+zhisun*Point,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //止损止盈都不设置
      if(zhisun==0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_BUYLIMIT,lots,prices,20,0,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
     }
   return sedS;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|          突破sell 
//+------------------------------------------------------------------+
bool sendSellStop(double prices,double lots,double zhisun,double zhiying,string zhushi,int mag,datetime time)
  {
   bool Return=false;
   bool sedS = false;
   int total = OrdersTotal();
   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderSymbol()==Symbol() && OrderType()==OP_SELLSTOP && OrderComment()==zhushi && OrderMagicNumber()==mag)
           {
            Return=true;
            break;
           }
        }
     }
   if(!Return)
     {
      ResetLastError();
      //止损止盈
      if(zhisun!=0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_SELLSTOP,lots,prices,20,Ask+zhisun*Point,Ask-zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设止盈
      if(zhisun==0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_SELLSTOP,lots,prices,20,0,Ask-zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设质止损
      if(zhisun!=0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_SELLSTOP,lots,prices,20,Ask+zhisun*Point,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //止损止盈都不设置
      if(zhisun==0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_SELLSTOP,lots,prices,20,0,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
     }
   return sedS;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|               突破buy
//+------------------------------------------------------------------+
bool sendBuyStop(double prices,double lots,double zhisun,double zhiying,string zhushi,int mag,datetime time)
  {
   bool Return=false;
   bool sedS = false;
   int total = OrdersTotal();
   for(int i=0;i<total;i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderSymbol()==Symbol() && OrderType()==OP_BUYSTOP && OrderComment()==zhushi && OrderMagicNumber()==mag)
           {
            Return=true;
            break;
           }
        }
     }
   if(!Return)
     {
      ResetLastError();
      //止损止盈
      if(zhisun!=0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_BUYSTOP,lots,prices,20,Bid-zhisun*Point,Bid+zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设止盈
      if(zhisun==0 && zhiying!=0)
        {
         sedS=OrderSend(Symbol(),OP_BUYSTOP,lots,prices,20,0,Bid+zhiying*Point,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //只设质止损
      if(zhisun!=0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_BUYSTOP,lots,prices,20,Bid-zhisun*Point,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
      //止损止盈都不设置
      if(zhisun==0 && zhiying==0)
        {
         sedS=OrderSend(Symbol(),OP_BUYSTOP,lots,prices,20,0,0,zhushi,mag,time,clrAqua);
         if(!sedS)
           {
            printf("下单失败！请查询错误代码:"+(string)GetLastError());
           }
        }
     }
   return sedS;
  }
//+------------------------------------------------------------------+
