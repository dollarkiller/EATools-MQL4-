# EATools-MQL4
![GitHub](https://img.shields.io/cran/l/devtools.svg)
[![GitHub stars](https://img.shields.io/github/stars/dollarkiller/EATools-MQL4-.svg?style=popout&label=Stars)](https://github.com/dollarkiller/EATools-MQL4-)
[![GitHub forks](https://img.shields.io/github/forks/dollarkiller/EATools-MQL4-.svg?style=popout&label=Fork)](https://github.com/dollarkiller/EATools-MQL4-)

这是一个由[DollarKillerForex](https://www.dollarkiller.com/)研究院开源并维护的MQL4EA常用函数库

## 模块索引

* [***订单处理相关***](#订单处理相关)
  * [orders.mqh](#ordersmqh)


  ---

## 订单处理相关

## orders.mqh

- 脚本说明: 订单的buy sell buy_limit sell_limit  buy_stop sell_stop
- 项目地址: https://dollerkiller.com

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


---
Copyright (C) 2016-2018 DollerKiller <https://www.dollarkiller.com/)>
