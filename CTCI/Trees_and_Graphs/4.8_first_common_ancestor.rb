# Design an algorithm and write code to find the first common ancestor
# of two nodes in a binary tree. Avoid storing additional nodes
# in a data structe. NOTE: this is not necessarily a BST

require_relative 'binary_node_with_parent'

def common_ancestor_parent(node1, node2)
#walk up one parent at a time from either node, doesn't matter
#do any kind of search from that parent. if both nodes are included, bingo

  if node1.parent
    current_ancestor = node1.parent
  else
    #dfs with node1. if node2 ain't there, no dice
  end

  loop do
    #dfs with current_ancestor, looking for both nodes

    node_stack = [current_ancestor]
    nodes_found = 0

    until node_stack.empty?
      current_node = node_stack.pop

      if current_node == node1 || current_node == node2
        nodes_found += 1
      end

      return current_ancestor if nodes_found == 2

      node_stack.push(current_node.left) if current_node.left
      node_stack.push(current_node.right) if current_node.right
    end

    return 'impossibru' if current_ancestor.parent.nil?
    current_ancestor = current_ancestor.parent
  end

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
b.parent = a
c.parent = a

b.left = d
b.right = e
d.parent = b
e.parent = b

c.left = f
c.right = g
f.parent = c
g.parent = c

p common_ancestor_parent(f, d)
