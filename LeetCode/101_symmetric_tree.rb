# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
#
# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
#
#     1
#    / \
#   2   2
#  / \ / \
# 3  4 4  3
# But the following [1,2,2,null,3,null,3] is not:
#     1
#    / \
#   2   2
#    \   \
#    3    3
# Note:
# Bonus points if you could solve it both recursively and iteratively.


# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  #bfs dis thing
  levels = []
  node_queue = [[root, 0]]

  until levels[-2] && levels[-2].all? { |el| el == nil }
    node, depth = node_queue.shift

    if levels[depth]
      if node.nil?
        levels[depth].push(nil)
      else
        levels[depth].push(node.val)
      end
    else
      if node.nil?
        levels[depth] = [nil]
      else
        levels[depth] = [node.val]
      end
    end

    if node.nil?
      node_queue.concat([[nil, depth + 1], [nil, depth + 1]])
    else
      if node.left
        node_queue.push([node.left, depth + 1])
      else
        node_queue.push([nil, depth + 1])
      end
      if node.right
        node_queue.push([node.right, depth + 1])
      else
        node_queue.push([nil, depth + 1])
      end
    end

  end
  levels[0..-3].all? { |level| palindrome?(level)}

end

def palindrome?(arr)
  arr == arr.reverse
end




def is_symmetric_recur(root)
  return isMirror(root, root)
end

def isMirror(n1, n2)
  return true if n1 == null && n2 == null
  return false if n1 == null || n2 == null
  return n1.val == n2.val &&
    isMirror(n1.left, n2.right) &&
    isMirror(n1.right, n2.left)
end
