Fork of gorilla/handlers
================

This is a fork of the [Gorilla Handlers toolkit](https://git.netsplit.it/enrico204/handlers). I use some of their handlers in my projects, so I decided to fork the repository and maintain the handlers I use (I removed the code that I don't use).

---

Package handlers is a collection of handlers (aka "HTTP middleware") for use
with Go's `net/http` package (or any framework supporting `http.Handler`), including:

* [**LoggingHandler**](https://godoc.org/git.netsplit.it/enrico204/handlers#LoggingHandler) for logging HTTP requests in the Apache [Common Log
  Format](http://httpd.apache.org/docs/2.2/logs.html#common).
* [**CombinedLoggingHandler**](https://godoc.org/git.netsplit.it/enrico204/handlers#CombinedLoggingHandler) for logging HTTP requests in the Apache [Combined Log
  Format](http://httpd.apache.org/docs/2.2/logs.html#combined) commonly used by
  both Apache and nginx.
* [**ContentTypeHandler**](https://godoc.org/git.netsplit.it/enrico204/handlers#ContentTypeHandler) for validating requests against a list of accepted
  content types.
* [**ProxyHeaders**](https://godoc.org/git.netsplit.it/enrico204/handlers#ProxyHeaders) for populating `r.RemoteAddr` and `r.URL.Scheme` based on the
  `X-Forwarded-For`, `X-Real-IP`, `X-Forwarded-Proto` and RFC7239 `Forwarded`
  headers when running a Go server behind a HTTP reverse proxy.
* [**RecoveryHandler**](https://godoc.org/git.netsplit.it/enrico204/handlers#RecoveryHandler) for recovering from unexpected panics.

## Example

A simple example using `handlers.LoggingHandler`:

```go
package main

import (
    "net/http"
    "git.netsplit.it/enrico204/handlers"
)

func main() {
    r := http.NewServeMux()

    // Only log requests to our admin dashboard to stdout
    r.Handle("/admin", handlers.LoggingHandler(os.Stdout, http.HandlerFunc(ShowAdminDashboard)))
    r.HandleFunc("/", ShowIndex)

    http.ListenAndServe(":8000", r)
}
```

## License

BSD licensed. See the included LICENSE file for details.

