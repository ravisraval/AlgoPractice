# Given preorder and inorder traversal of a tree, construct the binary tree.
#
# Note:
# You may assume that duplicates do not exist in the tree.

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def build_tree(preorder, inorder)
    return nil if preorder.nil? || inorder.nil?

  root = TreeNode.new(preorder.shift)
  return nil if root.val == nil

  split_idx = inorder.index(root.val)
  return root if split_idx.nil?

  left = inorder[0...split_idx]
  right = inorder[split_idx..-1]

  #find preorder split
  preorder.each_index do |idx|
    if right.include?(preorder[idx])
      split_idx = idx
      break
    end
  end

  unless preorder[0...split_idx].nil?
    root.left = build_tree(preorder[0...split_idx], left)
  end

  unless preorder[split_idx..-1].nil?
    root.right = build_tree(preorder[split_idx..-1], right)
  end

  root


end

inorder = [7,4,2,5,1,6,3]
preorder = [1,2,4,7,5,3,6]

preorder1 = [2,1,3]
inorder1 = [1,2,3]

p build_tree(preorder, inorder)
