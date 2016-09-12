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
* [Considerations](#considerations)
  * [DSL on Rack](#dsl-on-rack)
  * [Advanced routers](#advanced-routers)
  * [Micro frameworks](#micro-frameworks)
  * [Personal preference](#personal-preference)

## Scope
This is an (un)fair benchmark of most mature (version >= 1) pico-framework available for the Ruby programming language.

## What's pico?
With pico i intend very tiny routing Web framework, with almost no dependencies but for Rack.  

## Included frameworks
Here are the list of the pico-frameworks included in the benchmark:
* [Sinatra](http://www.sinatrarb.com/): is one of the first micro-frameworks for ruby, the most feature complete of the pack
* [Roda](http://roda.jeremyevans.net/): born form the ashes of [Cuba](http://cuba.is/) a performant tree-routing framework that can be extended via plug-ins 
* [Rack-App](http://www.rack-app.com/): a performant pico framework dependent on Rack only
* [NyNy](http://alisnic.github.io/nyny/): a tiny Web framework, dependent from ActionPack
* [Grape](https://github.com/ruby-grape/grape): an opinionated framework, with several dependencies
* [Hobbit](https://github.com/patriciomacadden/hobbit): a minimalistic microframework built on top of Rack.
* [Camping](https://github.com/camping/camping): proud to be a mere 4KB Web framework (the core part)
* [Syro](http://soveran.github.io/syro/): another, Cuba inspired, simple router for web applications.

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
Here are the benchmarks results ordered by increasing throughput, along with the size in Kb of the gem and its first level dependencies footprint.

| App Server   | Throughput (req/s) | Latency in ms (avg/stdev/max) | Size (Kb) | Dependencies |
| :------------| -----------------: | ----------------------------: | --------: | -----------: |
| Grape        |          14820.93  |              6.94/5.92/92.89  |     1484  |           9  |
| Sinatra      |          17640.65  |             6.45/5.80/110.60  |     1512  |           3  |
| Camping      |          19552.77  |              5.32/4.68/89.26  |      624  |           2  |
| NyNy         |          25774.92  |             3.72/4.22/125.46  |      144  |           2  |
| Rack-App     |          34003.95  |              2.50/3.18/95.15  |      624  |           1  |
| Roda         |          40346.38  |             2.40/3.44/107.80  |     1168  |           1  |
| Syro         |          41949.61  |             2.73/4.06/121.66  |       56  |           2  |
| Hobbit       |          42241.28  |              2.47/3.34/93.86  |       84  |           1  |
| Rack         |          43662.67  |             2.47/3.70/123.14  |     1248  |           0  |

## Considerations
After have inspected the tested framework i dare to categorize them within three different groups:

### DSL on Rack
Minimal libraries built on top of Rack APIs, offering (in some cases) identical performance, but leaving the burden (freedom?) of more complex features to the developer.  
Hobbit, Syro and NyNy fall within this group.

### Advanced routers
More advanced routers that offers desirable features (i.e. filters, streaming) aside from a pretty routing interface.  
Rack-App and Camping falls within this group.

### Micro frameworks
Libraries that add to the advanced routing features, extensibility via plug-ins/contributions.  
Sinatra, Grape and Roda falls within this group.

### Personal preference

#### Plain Rack
I admit that when i need raw performance over few endpoints i stick with raw Rack: it's pretty flexible and leave you writing less code than you think to get things done.  

#### Roda
When i need more features i stick with Roda, for the following reasons: 
* although it is feature-complete it only depends on Rack
* is fast, very close to plain Rake
* it integrates perfectly with [Sequel](http://sequel.jeremyevans.net/), also from the Ruby-hero [Jeremy Evans](https://github.com/jeremyevans). 
