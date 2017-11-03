# Given a binary tree, return all root-to-leaf paths.
#
# For example, given the following binary tree:
#
#    1
#  /   \
# 2     3
#  \
#   5
# All root-to-leaf paths are:
#
# ["1->2->5", "1->3"]
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {String[]}

def binary_tree_paths(root)
  paths = []
  return paths if root.nil?

  node_stack = [[root, []]]

  until node_stack.empty?
    node, path = node_stack.pop

    if node.left.nil? && node.right.nil?
      paths.push((path + [node.val]).join("->"))
    else

      if node.left
        node_stack.push([node.left, path + [node.val]])
      end
      if node.right
        node_stack.push([node.right, path + [node.val]])
      end

    end

  end
  paths
end

a = TreeNode.new(1)
b = TreeNode.new(2)
c = TreeNode.new(3)
d = TreeNode.new(5)

a.left = b
a.right = c
b.right = d
p binary_tree_paths(a)
