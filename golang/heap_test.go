package golang

import (
	"testing"
)

func TestHeapInt64(t *testing.T) {

	testInts := []int64{3, 1, 3, 5, 1, 1, 2, 6}
	h := NewHeapInt64(testInts)
	for i, v := range testInts {
		if h.Get(i) != v {
			t.Fatalf("Expected %d got %d", v, h.Get(i))
		}
	}
	pv := h.Pop()
	if pv != 6 {
		t.Fatalf("Expected pop value to be 6, got %d", pv)
	}
	sndPv := h.Pop()
	if sndPv != 5 {
		t.Fatalf("Expected sorted heap next should be 5, got %d", sndPv)
	}

	h.Push(pv)
	v := h.Get(h.Len() - 1)
	if v != 6 {
		t.Fatalf("Expected push value to be 6, got %d", v)
	}
}
