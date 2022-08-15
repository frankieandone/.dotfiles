now() {
  date "+%Y-%m-%dT%H-%M-%S";
}

# https://serverfault.com/questions/151109/how-do-i-get-the-current-unix-time-in-milliseconds-in-bash
now_as_timestamp() {
  date +%s%3N
}