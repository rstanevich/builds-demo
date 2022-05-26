package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	_ "net/http/pprof"
	_ "github.com/golang/protobuf/proto"
)

type Response struct {
	Message string `json:"string"`
}

func sign() string {
	return "!"
}

func main() {
	http.HandleFunc("/", handletRequest)
	fmt.Printf("Starting HTTP server on :%v", 8080)
	if err := http.ListenAndServe(fmt.Sprintf("0.0.0.0:%v", 8080), nil); err != nil {
		panic(fmt.Sprintf("Listen and serve HTTP Error: %v", err))
	}
}

func handletRequest(w http.ResponseWriter, req *http.Request) {
	if req.Method == "GET" {
		resp := Response{Message: sign()}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(resp)
	}
}
