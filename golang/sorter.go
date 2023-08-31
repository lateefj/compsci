package golang

/*
* For review and educational purposes this is implementing a sorting packaged. In real code would just use the standard library
 */

type Sortable interface {
	Len() int
	Less(i, j int) bool
	Swap(i, j int)
}

func partition(s Sortable, low, high int) int {
	pivot := high
	for j := low; j < high; j++ {
		if s.Less(j, pivot) {
			s.Swap(j, low)
			low += 1
		}
	}
	s.Swap(low, high)
	return low
}

func qsort(s Sortable, low, high int) {
	if low > high {
		return
	}
	p := partition(s, low, high)
	qsort(s, low, p-1)
	qsort(s, p+1, high)
}

func Quick(s Sortable) {
	qsort(s, 0, s.Len()-1)
}
