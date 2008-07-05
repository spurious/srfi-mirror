(library (xitomatl srfi private include-resolve compat)
  (export
    search-paths)
  (import
    (rnrs base)
    (only (core) scheme-library-paths))

  (define (search-paths)
    (scheme-library-paths))
)
