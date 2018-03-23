require_relative 'bst_node'
require_relative 'binary_search_tree'


def kth_largest(tree_node, k)
  bst = BinarySearchTree.new(tree_node)
  in_order = bst.in_order_traversal
  bst.find(in_order[0 - k])
end
