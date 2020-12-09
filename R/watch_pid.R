#' watch pid
#'
#' Given a process id (pid), watches the process, and if the process dies, then
#' takes an action given by the supplied function. Also able to take action if
#' the process is still alive.
#'
#' @param pid the process ID to watch
#' @param check_interval how often to check the process in seconds (default is 60)
#' @param dead_action what to do if the process no longer exists (display message)
#' @param alive_action what to do if the process is alive
#'
#' @export
#' @return NULL
watch_pid = function(pid = NULL,
                     check_interval = 60,
                     dead_action = function(){message("He's dead Jim!")},
                     alive_action = NULL) {
  if (is.null(pid)) {
    stop("No process supplied!")
  }

  status_str = paste0("--pid ", pid)
  pid_status = system2("ps", status_str, stdout = FALSE)

  if (pid_status == 1) {
    dead_action
  }
  # loop_count = 0
  while (pid_status == 0) {
    Sys.sleep(check_interval)
    pid_status = system2("ps", status_str, stdout = FALSE)

    if (!is.null(alive_action)) {
      alive_action()
    }

    # loop_count = loop_count + 1
    # message(loop_count)
  }
  dead_action()
}
