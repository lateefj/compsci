/*
There must be something wrong with my implementation
because it seems to simple. So I will just test that
I can build one and add nodes to it.
*/
package compsci

import (
	"fmt"
	"testing"
)

func TestTreeCRUD(t *testing.T) {
	tree := &Tree{NewNode(nil, nil)}
	for i, _ := range make([]int, 10) {
		tree.Root.Add(NewNode(tree.Root, i))
	}
	if len(tree.Root.Children) != 10 {
		t.Errorf(fmt.Sprintf("Expected 10 children but got %d\n", len(tree.Root.Children)))
	}
	tree.Root.Delete(tree.Root.Children[5])
	if len(tree.Root.Children) != 9 {
		t.Errorf(fmt.Sprintf("Expected 9 children but got %d\n", len(tree.Root.Children)))
	}
	for _, x := range tree.Root.Children {
		if x.Value == 4 { // 0, 1, 2, 3 but not 4 in the 5th position
			t.Errorf(fmt.Sprintf("Didn't expect 4 to be in children but it is"))
		}
	}
}
