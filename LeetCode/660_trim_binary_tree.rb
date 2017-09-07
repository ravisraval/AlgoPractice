# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end


def trim_bst(root, l, r)
    good_nodes = []

    #dfs to get nodes within bounds
    queue = [root]
    until queue.empty?
        current_node = queue.shift

        if current_node.val >= l && current_node.val <= r
            good_nodes.push(current_node)
        end

        queue.push(current_node.left) if current_node.left
        queue.push(current_node.right) if current_node.right

    end
    p good_nodes
    #make tree with good nodes with minimal height
    # new_root = good_nodes.shift
    #
    # good_nodes.each do |node|
    #
    #     if node.val < new_root.val


end


a = TreeNode.new(5)
b = TreeNode.new(3)
c = TreeNode.new(7)
d = TreeNode.new(4)
e = TreeNode.new(6)
a.left = b
b.right = d
a.right = c
c.left = e

trim_bst(a, 4, 6)
