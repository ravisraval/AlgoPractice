# Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
#
# Note:
# You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
#
# Follow up:
# What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)

    list = traverse(root, k, [])
    list[k - 1]

end

def traverse(node, k, list)
    if node.left
        list = traverse(node.left, k, list)
    end
    list.push(node.val)
    if node.right
        list = traverse(node.right, k, list)
    end
    list
end

# def traverse(node, k, list)
#     if node.left
#         list, k = traverse(node.left, k, list)
#     end
#
#     list.push(node.val)
#     k -= 1
#     if k == 0
#       return node.val
#     end
#
#     if node.right
#         list, k = traverse(node.right, k, list)
#     end
#     [list, k]
# end
