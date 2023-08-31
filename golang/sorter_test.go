package golang

import "testing"

func TestSortQuick(t *testing.T) {
	h := NewHeapInt64([]int64{3, 1, 3, 5, 1, 1, 2, 6})
	if h.Get(0) != 3 {
		t.Fatalf("Expected first element 3, got %d", h.Get(0))
	}
	Quick(h)
	if h.Get(0) != 1 {
		t.Fatalf("Expected first element 1, got %d", h.Get(0))
	}
	if h.Get(h.Len()-1) != 6 {
		t.Fatalf("Expected first element 6, got %d", h.Get(h.Len()-1))
	}
}
