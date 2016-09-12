## Table of Contents

* [Scope](#scope)
* [What's pico?](#what-s-pico)
* [Included frameworks](#included-frameworks)
  * [Raw Rack](#raw-rack)
* [Application](#application)
* [Benchmarks](#benchmarks)
  * [Platform](#platform)
  * [Puma](#puma)
  * [Wrk](#wrk)
  * [Bootstrap](#bootstrap)
  * [Results](#results)

## Scope
This is an (un)fair benchmark of most mature (version >= 1) pico-framework available for the Ruby programming language.

## What's pico?
With pico i intend very tiny routing Web framework, with almost no dependencies but for Rack.  

## Included frameworks
Here are the list of the pico-frameworks included in the benchmark:
* [Sinatra](http://www.sinatrarb.com/): is one of the first micro-frameworks for ruby, the most feature complete of the pack
* [Roda](http://roda.jeremyevans.net/): born form the ashes of [Cuba](http://cuba.is/) a performant tree-routing framework that can be extended via plug-ins 
* [RackApp](http://www.rack-app.com/): a performant pico framework dependent on Rack only
* [NyNy](http://alisnic.github.io/nyny/): a tiny Web framework, dependent from ActionPack
* [Ramaze](http://ramaze.net/): a small, modular Web framework
* [Grape](https://github.com/ruby-grape/grape): an opinionated framework, with several dependencies
* [Hobbit](https://github.com/patriciomacadden/hobbit): a minimalistic microframework built on top of Rack.
* [Camping](https://github.com/camping/camping): proud to be a mere 4KB Web framework (the core part)

### Raw Rack
I also included a plain rack application to see how much each solution diverge from the raw metal.

## Application
The "application" i tested is barely minimal: it is the HTTP version of the "Hello World" example.

## Benchmarks

### Platform
I registered these benchmarks with a MacBook PRO 15 mid 2015 having these specs:
* OSX El Captain
* 2,2 GHz Intel Core i7 (4 cores)
* 16 GB 1600 MHz DDR3
* Ruby 2.3.1p112

### Puma
All of the pico framework run over the mighty [Puma](http://puma.io/) application server.

### Wrk
I used [wrk](https://github.com/wg/wrk) as the loading tool.
I measured each application server three times, picking the best lap (apart for JVM that demands warm-up).  
Here is the common script i used:

```
wrk -t 4 -c 100 -d30s --timeout 2000 http://127.0.0.1:9292
```

### Bootstrap
```
bundle exec puma -w 7 --preload config.ru
```

### Results
Here are the benchmarks results ordered by increasing throughput.

| App Server   | Throughput (req/s) | Latency in ms (avg/stdev/max) | Delta from rack % |
| :------------| -----------------: | ----------------------------: | ----------------: |
| Ramaze       |           4127.44  |           20.17/19.42/299.00  |             90.7  |
| Grape        |          15393.65  |              3.58/3.99/62.34  |             65.6  |
| Sinatra      |          19130.20  |             4.47/4.33/128.41  |             57.2  |
| Camping      |          20322.49  |             4.75/4.77/128.82  |             54.6  |
| NyNy         |          22124.41  |              4.22/3.36/87.65  |             50.6  |
| RackApp      |          33858.52  |             3.26/5.79/135.76  |             24.4  |
| Roda         |          40492.11  |             2.55/4.09/130.58  |              9.6  |
| Hobbit       |          41595.06  |             2.57/3.75/108.26  |              7.1  |
| Rack         |          44813.41  |              2.19/2.80/96.79  |              0.0  |
