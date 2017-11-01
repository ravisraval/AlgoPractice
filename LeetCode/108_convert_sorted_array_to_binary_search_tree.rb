# Given an array where elements are sorted in ascending order, convert it to a height balanced BST.


# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {Integer[]} nums
# @return {TreeNode}

def sorted_array_to_bst(nums)

  return nil if nums.empty?
  mididx = nums.length / 2

  new_node = TreeNode.new(nums[mididx])
  new_node.left = sorted_array_to_bst(nums[0...mididx])
  new_node.right = sorted_array_to_bst(nums[mididx + 1 .. -1])

  new_node
end

p sorted_array_to_bst([1,2,3,4,5])
