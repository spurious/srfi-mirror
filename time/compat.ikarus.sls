(library (srfi time compat)
  (export
    format
    host:current-time 
    host:time-nanosecond 
    host:time-second 
    host:time-gmt-offset)
  (import
    (only (ikarus) format)
    (prefix (only (ikarus) current-time time-nanosecond time-second time-gmt-offset) 
            host:)))
