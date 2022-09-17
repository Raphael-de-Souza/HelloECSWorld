package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	_ "github.com/go-sql-driver/mysql"
	"github.com/joho/godotenv"
)

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to a simple GO WebServer!")
}

func returnLive(w http.ResponseWriter, r *http.Request) {
	if dbConn() {
		fmt.Fprintf(w, "Well done")
	} else {
		fmt.Fprintf(w, "Running")
	}
}

func handleRequests() {
	http.HandleFunc("/", homePage)
	http.HandleFunc("/live", returnLive)
	log.Fatal(http.ListenAndServe(os.Getenv("SERVERHOST")+":"+os.Getenv("SERVERPORT"), nil))
}

func dbConn() (ret bool) {
	conn, err := sql.Open("mysql", os.Getenv("DBUSER")+":"+os.Getenv("DBPWD")+"@tcp("+os.Getenv("DBHOST")+":"+os.Getenv("DBPORT")+")/"+os.Getenv("DB"))
	if err != nil {
		ret = false
	}
	err = conn.Ping()
	if err != nil {
		ret = false
	} else {
		ret = true
	}
	conn.Close()
	return ret
}

func main() {

	if len(os.Args) > 1 {
		loadEnvVariable(os.Args[1])
	}

	handleRequests()
}

// use godotenv package to load/read the .env file and
// return the value of the key
func loadEnvVariable(envFile string) {
	err := godotenv.Load(envFile)
	if err != nil {
		log.Fatalf("File not found: " + envFile)
	}
	println("Using " + envFile)
}
