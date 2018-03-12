# The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.
#
# Determine the maximum amount of money the thief can rob tonight without alerting the police.
#
# Example 1:
#      3
#     / \
#    2   3
#     \   \
#      3   1
# Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
# Example 2:
#      3
#     / \
#    4   5
#   / \   \
#  1   3   1
# Maximum amount of money the thief can rob = 4 + 5 = 9.

#thoughts: do dfs with house robber 1 strat

class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

def rob(root)
  _rob_(root).max
end

private def _rob_(root)
  return [0, 0] if root.nil?

  l, r = _rob_(root.left), _rob_(root.right)
  return [l.max + r.max, l[0] + r[0] + root.val]
end


a = TreeNode.new(5)
b = TreeNode.new(2)
c = TreeNode.new(3)
d = TreeNode.new(7)
e = TreeNode.new(1)
f = TreeNode.new(9)
g = TreeNode.new(10)
h = TreeNode.new(5)


a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g
d.left = h

p rob(a)
