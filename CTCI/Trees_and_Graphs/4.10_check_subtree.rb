# T1 and T2 are two very large binary trees, with T1 much bigger than T2.
# Create an algorithm to determine if T2 is a subtree of T1.
#
# A tree T2 is a subtree of T1 if there exists a node n in T1 such that
# the subtree of n is identical to T2. That is, if you cut off the tree
# at node n, the two trees would be identical.

#first thoughts
#bfs T1 until you find the top of T2, then do a simultaneous traversal

require_relative 'binary_node'

def check_subtree(t1_root, t2_root)

  t1_node_queue = [t1_root]


  until t1_node_queue.empty?

    current_t1_node = t1_node_queue.shift
    #because a node itself contains pointers to all its children... :
    return true if current_t1_node == t2_root
    #NOTE: so maybe CTCI means that the data / values of the nodes are
    #identical, but they're not literally same node. In that case,
    #line 22 would call some match_tree(t1_node, t2_root) helper

    t1_node_queue.push(current_t1_node.left) if current_t1_node.left
    t1_node_queue.push(current_t1_node.right) if current_t1_node.right

  end

  false
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

c.left = f
c.right = g

p check_subtree(a, c)
