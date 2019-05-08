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
* OSX High Sierra
* 2,2 GHz Intel Core i7 (4 cores)
* 16 GB 1600 MHz DDR3
* Ruby 2.5.1

### Puma
All of the pico framework run over the mighty [Puma](http://puma.io/) application server.

### Wrk
I used [wrk](https://github.com/wg/wrk) as the loading tool.
I measured each application server three times, picking the best lap:
```
wrk -t 4 -c 100 -d30s --timeout 2000 http://0.0.0.0:9292/<app-name>
```

### Bootstrap
```
bundle exec puma -w 8 --preload -e production config.ru
```

### Results
Here are the benchmarks results ordered by increasing throughput, along with the runtime dependencies footprint (measured by [lapidarius gem](https://rubygems.org/gems/lapidarius)).

| App Server   | Throughput (req/s) | Runtime deps. |
| :------------| -----------------: | ------------: |
| Grape        |          16921.19  |           17  |
| Sinatra      |          20190.13  |            4  |
| Camping      |          24707.91  |            2  |
| NyNy         |          33596.17  |            2  |
| Rack-App     |          34769.03  |            1  |
| Hobbit       |          42166.56  |            1  |
| Syro         |          49180.78  |            2  |
| Roda         |          50417.63  |            1  |
| Rack         |          51577.39  |            0  |

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
I admit that when i need raw performance over few endpoints i stick with raw Rack: it is pretty flexible and leave you writing less code than you think to get things done.  

#### Roda
When i need more features i stick with Roda, for the following reasons: 
* although it is feature-complete it only depends on Rack
* is fast, very close to plain Rack
* it integrates perfectly with [Sequel](http://sequel.jeremyevans.net/), also from the Ruby-hero [Jeremy Evans](https://github.com/jeremyevans). 
