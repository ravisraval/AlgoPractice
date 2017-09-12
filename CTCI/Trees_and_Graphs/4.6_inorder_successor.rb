# write an algo to find the 'next' node (i.e. in-order successor) of a
# given node in a bst. you may assume each node has a link to its parent

require_relative 'binary_node_with_parent'

def inorder_successor(given_node)

  #if it has a right child, go there, otherwise answer is
  #parent, or if parent visited, something else

  if given_node.right
    current_node = given_node.right

    while current_node.left
      current_node = current_node.left
    end

    return current_node.value
  end

  #if I go to parent, and parent is greater than me, return parent
  if given_node.parent.value > given_node.value
    return given_node.parent.value
  end

  #if parent is smaller, aka i was its right child...
  ancestor_node = given_node.parent
  until ancestor_node.value > given_node.value
    return 'given node was terminus' if ancestor_node.parent.nil?
    ancestor_node = ancestor_node.parent
  end
  ancestor_node.value

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

p inorder_successor(d)
p inorder_successor(b)
p inorder_successor(e)
p inorder_successor(a)
p inorder_successor(f)
p inorder_successor(c)
p inorder_successor(g)
