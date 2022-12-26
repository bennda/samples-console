package main

import (
	"bytes"
	"flag"
	"fmt"
	"math/rand"
	"os"
	"time"
)

type Parameters struct {
	mode      string
	text      string
	randomMin int
	randomMax int
}

func parseArgs(progname string, args []string) (config *Parameters, output string, err error) {
	flags := flag.NewFlagSet(progname, flag.ContinueOnError)
	var buf bytes.Buffer
	flags.SetOutput(&buf)

	var conf Parameters
	flags.StringVar(&conf.mode, "mode", "echo", "set greeting")
	flags.StringVar(&conf.text, "text", "text", "set text")
	flags.IntVar(&conf.randomMin, "randmin", 0, "set randomMin")
	flags.IntVar(&conf.randomMax, "randmax", 1000, "set randomMax")

	err = flags.Parse(args)
	if err != nil {
		return nil, buf.String(), err
	}
	return &conf, "", nil
}

func GenerateRandomNumber(minimum int, maximum int) int {
	numrange := (maximum - minimum)
	random := rand.New(rand.NewSource(time.Now().UTC().UnixNano())).Intn(numrange)
	return minimum + random
}

func main() {
	args, _, err := parseArgs(os.Args[0], os.Args[1:])

	if err != nil {
		fmt.Println("invalid param")
		os.Exit(1)
	}

	switch args.mode {
	case "echo":
		fmt.Println(args.text)
	case "random":
		fmt.Println(GenerateRandomNumber(args.randomMin, args.randomMax))
	default:
		fmt.Println("invalid mode")
		os.Exit(1)
	}
}
