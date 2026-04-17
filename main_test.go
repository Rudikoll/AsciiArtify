package main

import "testing"

func TestDummy(t *testing.T) {
	result := 2 + 2
	if result != 4 {
		t.Error("Test failed")
	}
}