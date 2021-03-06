% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/watch_pid.R
\name{watch_pid}
\alias{watch_pid}
\title{watch pid}
\usage{
watch_pid(
  pid = NULL,
  check_interval = 60,
  dead_action = function() {     message("He's dead Jim!") },
  alive_action = NULL
)
}
\arguments{
\item{pid}{the process ID to watch}

\item{check_interval}{how often to check the process in seconds (default is 60)}

\item{dead_action}{what to do if the process no longer exists (display message)}

\item{alive_action}{what to do if the process is alive}
}
\description{
Given a process id (pid), watches the process, and if the process dies, then
takes an action given by the supplied function. Also able to take action if
the process is still alive.
}
