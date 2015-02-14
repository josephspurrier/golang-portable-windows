// Copyright 2015 Joseph Spurrier
// Author: Joseph Spurrier (http://josephspurrier.com)
// License: http://www.apache.org/licenses/LICENSE-2.0.html

// Package main_test performs testing on main package
package main_test

import (
	"fmt"
	"testing"
)

// Prepare tests
/*func TestMain(m *testing.M) {
}*/

// Assertion test
func TestOutput(t *testing.T) {
	// Function to easily test expected values
	assertEqual := func(expectedValue interface{}, actualValue interface{}) {
		if actualValue != expectedValue {
			t.Errorf("\n got: %v\nwant: %v", actualValue, expectedValue)
		}
	}

	val := "Hello"
	assertEqual("Hello", val)
}

// Benchmark test
func BenchmarkHello10(b *testing.B) {
	for n := 0; n < b.N; n++ {
		fmt.Println("Hello")
	}
}

// Race condition test
func TestGo(t *testing.T) {
	go fmt.Println("Hello")
}

// Example code test
func ExampleOutput() {
	fmt.Println("Hello")
	// Output: Hello
}
