# EATools-MQL4
![GitHub](https://img.shields.io/cran/l/devtools.svg)
[![GitHub stars](https://img.shields.io/github/stars/dollarkiller/EATools-MQL4-.svg?style=popout&label=Stars)](https://github.com/dollarkiller/EATools-MQL4-)
[![GitHub forks](https://img.shields.io/github/forks/dollarkiller/EATools-MQL4-.svg?style=popout&label=Fork)](https://github.com/dollarkiller/EATools-MQL4-)

这是一个由[DollarKillerForex](https://www.dollarkiller.com/)研究院开源并维护的MQL4EA常用函数库

## 模块索引

* [***订单处理相关***](#订单处理相关)
  * [orders.mqh](#ordersmqh)
  * [orderProcessing.mqh](#orderProcessingmqh)


  ---

## 订单处理相关

## orders.mqh

- 模块说明: 订单的buy sell buy_limit sell_limit  buy_stop sell_stop
- 项目地址: https://www.dollarkiller.com/

#### 模块特点:
更方便的对订单进行操作

返回值bool  
- 支持 sell() 做空  buy()做多
- 支持 sendBuyLimit()挂单limit多
- 支持 sendSellLimit()挂单limit空
- 支持 订单识别码限制


#### 调用:
```
sell(手数,止损,止盈,注释,订单识别码)
sendBuyLimit(开仓价格,手数,止损,止盈,注释,订单识别码,时间) 
```

---

## orderProcessing.mqh

- 模块说明: 一键平仓 止损 止盈 相关
- 项目地址: https://www.dollarkiller.com/

#### 模块特点:
更方便的对订单进行操作


#### 调用:
```
     一键删除挂单allGua()    一键获取挂单量allOrderGua() 返回int
     修改buy单止盈止损buySet(止损,止盈)
     修改sell单止盈止损sellSet(止损,止盈)    
     一键全平allPing()     
     一键平多单buyPing()     一键平空单 sellPing()                                                     
     获取当前订单数allOrder()
     获取多单订单数 buyOrder()  获取空单订单数sellOrder()
```

---

## 支持我们：
![BITCOIN](https://upload-images.jianshu.io/upload_images/2489344-3639313b9aafccd7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

地址:1J45xN5oSXNm3QyyWH68Sx1hNa8HAAFntJ

>根据比特币交易规则，当该交易被六个区块或以上的区块链确认后，资金就会被转入您的账户。想要加快确认过程，我们建议您选择最高的手续费金额。存入资金的手续费将不被补偿。
---
Copyright (C) 2016-2018 DollerKiller <https://www.dollarkiller.com/)>
