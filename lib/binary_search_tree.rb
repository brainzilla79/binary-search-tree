# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root
  
  def initialize
    @root = nil
  end

  def insert(value)
    node = BSTNode.new(value)
    if !@root 
      @root = node 
    else 
      insert_node(node)
    end 
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    
    if value <= tree_node.value 
      node = find(value, tree_node.left) if tree_node.left
    end 

    if value > tree_node.value 
      node = find(value, tree_node.right) if tree_node.right
    end 

    node
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

  def insert_node(node, tree_node = @root)
    if node.value <= tree_node.value 
      if tree_node.left.nil?
        tree_node.left = node
        return 
      end 
      insert_node(node, tree_node.left)
    else 
      if tree_node.right.nil? 
        tree_node.right = node
        return 
      end 
      insert_node(node, tree_node.right)
    end 

  end 
end
