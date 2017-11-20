#
# Given a binary tree, determine if it is height-balanced.
#
# For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.


# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end
#doesn't work, because this doesn't follow LC's definition of balanced
# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  heights = {}
  return true if root.nil?


  node_stack = [[root, 0]]

  until node_stack.empty?
    node, depth = node_stack.pop

    if node.left.nil? && node.right.nil?
      unless heights.has_key?(depth)
        heights[depth] = true

        if heights.keys.length == 3 ||
          heights.keys.max - heights.keys.min > 1
          return false
        end

      end
    else
      node_stack.push([node.left, depth + 1]) if node.left
      node_stack.push([node.right, depth + 1]) if node.right
    end
  end
  true

end
