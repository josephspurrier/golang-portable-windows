// Copyright 2015 Joseph Spurrier
// Author: Joseph Spurrier (http://josephspurrier.com)
// License: http://www.apache.org/licenses/LICENSE-2.0.html

//go:generate goversioninfo -icon=icon.ico

/*
Package hello does something here.

Heading 1

Body text
	Preformatted code is indented
	May span multiple lines

*/
package main

import (
	"flag"
	"fmt"
	"os"
)

var (
	Version   string
	BuildDate string
)

func init() {
	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "Version: %s\n", Version)
		fmt.Fprintf(os.Stderr, "Build Date: %s\n", BuildDate)
		fmt.Fprintf(os.Stderr, "Usage of %s:\n", os.Args[0])
		flag.PrintDefaults()
	}
	flag.Parse()
}

func main() {
	fmt.Println("Hello")
}
