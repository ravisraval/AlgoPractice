# implement a function to check if a binary tree is balanced.
# For the purposes of this question, a blanaced tree is defined
# to be a tree such that the heights of the two subtrees of any node
# never differ by more than one.

require_relative 'binary_node'

def tree_balanced?(root_node)
  #dfs, note height at bottom
  node_stack = [[root_node, 0]]

  heights = []

  until node_stack.empty?
    current_node, current_height = node_stack.pop

    #if leaf node, push its height
    if !current_node.left && !current_node.right

      heights.push current_height unless heights.include? current_height
    end

    #check if heights are too far apart
    if heights.length > 2
      p heights
      return false
    end
    if heights.length == 2
      p heights
      return false if (heights[0] - heights[1]).abs > 1
    end

    #push children with height + 1
    if current_node.left
      node_stack.push([current_node.left, current_height + 1])
    end
    if current_node.right
      node_stack.push([current_node.right, current_height + 1])
    end

  end

  true
end


a = BinaryTreeNode.new(5)
b = BinaryTreeNode.new(3)
c = BinaryTreeNode.new(7)
d = BinaryTreeNode.new(2)
e = BinaryTreeNode.new(4)
f = BinaryTreeNode.new(6)
g = BinaryTreeNode.new(8)

a.left = b
a.right = c

b.left = d
b.right = e

d.left = f
# c.right = g

p tree_balanced?(a)
