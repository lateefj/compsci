package golang

type HeapInt64 struct {
	elements []int64
}

func NewHeapInt64(items []int64) *HeapInt64 {
	return &HeapInt64{elements: items}
}

func (hi *HeapInt64) Len() int {
	return len(hi.elements)
}

func (hi *HeapInt64) Less(i, j int) bool {
	return hi.elements[i] < hi.elements[j]
}

func (hi *HeapInt64) Swap(i, j int) {
	hi.elements[i], hi.elements[j] = hi.elements[j], hi.elements[i]
}

func (hi *HeapInt64) Pop() int64 {
	x := hi.elements[len(hi.elements)-1]
	hi.elements = hi.elements[:len(hi.elements)-1]
	return x
}

func (hi *HeapInt64) Push(x int64) {
	hi.elements = append(hi.elements, x)
}

func (hi *HeapInt64) Get(i int) int64 {
	return hi.elements[i]
}
