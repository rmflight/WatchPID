
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

![]("watch_pid_example.gif")
