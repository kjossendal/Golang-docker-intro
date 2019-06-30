package main

import (
	"fmt"
	"github.com/julienschmidt/httprouter"
	"log"
	"net/http"
	"os"
)

func indexHandler(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	// code here to see results at localhost:8080
	fmt.Fprintf(w, "Hello Golang web api!")
}

func main() {
	router := httprouter.New()
	router.GET("/", indexHandler)

	// code here to see results in terminal
	fmt.Println("Hello Golang terminal!")

	// print env
	env := os.Getenv("APP_ENV")
	if env == "production" {
		log.Println("Running api server in production mode")
	} else {
		log.Println("Running api server in dev mode")
	}

	http.ListenAndServe(":8080", router)

}