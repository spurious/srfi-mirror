(library (xitomatl srfi lightweight-testing compat)
  (export
    (rename (pretty-print pretty-print/no-trailing-newline)))
  (import
    (only (core) pretty-print))
)
