#!/usr/bin/Rscript
"
Usage:
  watch_textme.R [--pid=<pid>] [--dead-message=<dead-message>]
  watch_textme.R (-h | --help)

Description: Takes a process id (PID) to watch, and a message to send via {textme} if that
  process dies.

Options:
  --pid=<pid>                           a process id to watch
  --dead-message=<dead-message>         the message to send if the process dies
" -> doc

library(methods)
library(docopt)
library(tools)
suppressMessages(library(WatchPID))
suppressMessages(library(textme))
script_options <- docopt(doc)

main = function(script_options){
  pid = script_options$pid
  dead_message = script_options$dead_message
  if (is.null(pid)) {
    stop("You must supply a process id!")
  }
  if (is.null(dead_message)) {
    stop ("You must supply a message to send!")
  }

  dead_fun = function(){textme(dead_message)}
  watch_pid(pid, dead_action = dead_fun)
}

main(script_options)
