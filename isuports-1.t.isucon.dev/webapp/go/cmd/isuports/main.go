package main

import (
	"net/http"
	_ "net/http/pprof"

	isuports "github.com/isucon/isucon12-qualify/webapp/go"
)

func main() {
	go http.ListenAndServe(":6060", nil)
	isuports.Run()
}
