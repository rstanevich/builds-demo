package main

import "testing"

func TestSign(t *testing.T) {
	if token := sign(); token != "!" {
		t.Errorf("Unexpected token: %s", token)
	}
}
