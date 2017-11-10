# Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
#
# Basically, the deletion can be divided into two stages:
#
# Search for a node to remove.
# If the node is found, delete the node.
# Note: Time complexity should be O(height of tree).
#
# Example:
#
# root = [5,3,6,2,4,null,7]
# key = 3
#
#     5
#    / \
#   3   6
#  / \   \
# 2   4   7
#
# Given key to delete is 3. So we find the node with value 3 and delete it.
#
# One valid answer is [5,4,6,2,null,null,7], shown in the following BST.
#
#     5
#    / \
#   4   6
#  /     \
# 2       7
#
# Another valid answer is [5,2,6,null,4,null,7].
#
#     5
#    / \
#   2   6
#    \   \
#     4   7
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {Integer} key
# @return {TreeNode}
require 'byebug'
def delete_node(root, key)
  return nil if root.nil?
  #search for key node

  current_node = root
  until current_node.nil? || current_node.val == key
    if current_node.val < key
      current_node = current_node.right
    else
      current_node = current_node.left
    end
  end
  #if the tree doesn't have a node with that val, just return the tree
  return root if current_node.nil?

  #delete the node
  #if it's a leaf, ez pz
  debugger
  if current_node.left.nil? && current_node.right.nil?
    current_node = nil

  #if it only has one child, set it to be that child
  elsif current_node.left.nil?
    current_node = current_node.right
  elsif current_node.right.nil?
    current_node = current_node.left

  else #we actually have to do stuff if it has two children
    #let's find the greatest offspring that's less than this one
    node_to_replace = current_node.left
    while node_to_replace.right
      node_to_replace = node_to_replace.right
    end

    #once found, swap the values, delete the node that we used to swap
    current_node.val = node_to_replace.val
    node_to_replace = nil
  end

  root
end


a = TreeNode.new(5)
b = TreeNode.new(3)
c = TreeNode.new(6)
d = TreeNode.new(2)
e = TreeNode.new(4)
f = TreeNode.new(7)

a.left = b
b.left = d
b.right = e
a.right = c
c.right = f


p delete_node(a, 3)
