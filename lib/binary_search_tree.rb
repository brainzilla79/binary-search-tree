# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'byebug'
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root
  
  def initialize(root = nil)
    @root = root
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
    node = find(value)
    if node.left.nil? && node.right.nil?
      @root == node ? @root = nil : replace_node(node)
    elsif [node.left, node.right].compact.length == 1
      child_node = [node.left, node.right].compact.first
      replace_node(node, child_node)
    elsif node.left && node.right
      max = maximum(node.left)
      replace_node(node, max)
      max_child = max.left
      if max_child 
        max_child = max.left
        max_child.parent = node.left
        node.left.right = max_child
      end 
      max.left = node.left
      node.left.parent = max

    end 
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?
    [depth(tree_node.left), depth(tree_node.right)].max + 1
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    diff = (left_depth - right_depth).abs

    is_balanced?(tree_node.left) && is_balanced?(tree_node.right) && diff < 2
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node
      in_order_traversal(tree_node.left, arr)

      arr << tree_node.value

      in_order_traversal(tree_node.right, arr)
    end 
    arr
  end


  private
  # optional helper methods go here:

  def insert_node(node, tree_node = @root)
    if node.value <= tree_node.value 
      if tree_node.left.nil?
        tree_node.left = node
        node.parent = tree_node
        return 
      end 
      insert_node(node, tree_node.left)
    else 
      if tree_node.right.nil? 
        tree_node.right = node
        node.parent = tree_node
        return 
      end 
      insert_node(node, tree_node.right)
    end 

  end

  def replace_node(node, replacement = nil)
    if node.value <= node.parent.value
      node.parent.left = replacement
    else 
      node.parent.right = replacement
    end 
  end 
  
end
