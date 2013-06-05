/*
This is an implementaion of a tree data structure from scratch.

Reference: https://en.wikipedia.org/wiki/Tree_(data_structure)
I haven't written a tree implementation in over a decade but I
am using wikipedia article as reference. I am pretty sure there
is an implementation in the containers package in the standard
library however I dare not look since that would be cheeting.

*/
package compsci

import (
	"sort"
)

type Node struct {
	Parent   *Node   // only root has nil parent
	Children []*Node // leaf nodes have no children
	Value    interface{}
}

func (node *Node) Add(n *Node) {
	node.Children = append(node.Children, n)
}

func (node *Node) Delete(n *Node) {
	total := len(node.Children)
	i := sort.Search(len(node.Children), func(i int) bool {
		return node.Children[i] == n
	})
	nc := node.Children[:i-1]

	if i < total-1 {
		for _, x := range node.Children[i:total] {
			nc = append(nc, x)
		}
	}
	node.Children = nc
}

func NewNode(parent *Node, value interface{}) *Node {
	return &Node{parent, make([]*Node, 0), value}
}

// There must be more to this but I am forgetting something
type Tree struct {
	Root *Node
}
