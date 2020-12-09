
# WatchPID

<!-- badges: start -->
<!-- badges: end -->

WatchPID provides a simple, single function that watches a "process id" (PID) at given intervals, and executes functions if that process is *alive* or *dead*.

## Installation

You can install WatchPID from github:

``` r
remotes::install_github("rmflight/WatchPID")
```

## Example

Here is a gif of an example where we are watching another R process every 1 second, and simply reporting if it is alive or dead:

![](watch_pid_example.gif)

## Note Use of Functions!

Note that `watch_pid` evaluates passed functions, so whatever you want to have happen when the process is still alive or it's dead, that needs to be a function.
Here are some examples:

``` r
report_alive = function(){
  message("still alive!")
}
report_dead = function(){
  message("it's dead now ...")
}

watch_pid(pid, dead_action = report_dead, alive_action = report_alive)
```

Notice these are functions without any arguments.

## Other Options

You could also use the [beepr](https://cran.r-project.org/web/packages/beepr/index.html) package to play sounds locally, or [textme](https://github.com/richpauloo/textme) to text yourself from something on a remote machine (cluster?!, AWS, etc).

``` r
beepr_dead = function(){
  beepr::beep(2)
}

textme_dead = function(){
  textme::textme("it died :-(")
}
```

## Issues

If you find any issues, please report them [here](https://github.com/rmflight/WatchPID/issues).
