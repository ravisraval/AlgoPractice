# You are implementing a binary tree class from scratch which, in addition
# to insert, find, and delete, has a method getRandomNode() which returns
# a random node from the tree. All nodes should be equally likely to be
# chosen. Design and implement an algorithm to getRandomNode, and explain
# how you would implement the rest of the methods.

#thoughts:
#can i just make this a BST? then everything would be pretty straightforward
#maybe that doesn't make sense though..
#ok well the first hint on CTCI is talking as if everyone assumes its
#a BST. k...

#could just have everything insert in order across depths, like a bfs
#find and delete would take O(n) time in that case, which seems fine
#I could keep a hash, where key is depth, and value is how many are
#filled in. Perhaps that would help keep track of insertion, so insertion
#would be O(1). But then how would we deal with insert after a delete..

#getRandomNode could easily be O(n). If your binarytree class keeps
#track of how many nodes it has, you could pick a random number, and stop
#after that many moves of bfs or whatever. That way, it's random, and
#doesn'take up any more space.


#how the book's solution differs: keep track of how many nodes are to
#the left and right of each node. randomly pick a direction, weighted
#by how many nodes there are on whichever side. staying in place would
#be one possibilty as well.

require_relative 'binary_node_with_parent'

class BinaryTree
#delete no worky
  def initialize
    @root = nil
    @node_count = 0
  end

  def insert(value)
    #for a BST
    #if we have nothing so far
    @node_count += 1
    if @root.nil?
      @root = BinaryTreeNode.new(value)
      return @root
    end

    current_node = @root
    loop do

      if current_node.value < value

        if current_node.right
          current_node = current_node.right
        else
          current_node.right = BinaryTreeNode.new(value)
          return current_node.right
        end

      else

        if current_node.left
          current_node = current_node.left
        else
          current_node.left = BinaryTreeNode.new(value)
          return current_node.left
        end

      end

    end


  end

  def find(value)
    current_node = @root

    while current_node

      if current_node.value < value
        current_node = current_node.right
      elsif current_node.value > value
        current_node = current_node.left
      else #we found it
        return current_node
      end

    end

    puts 'No such value'
  end

  def delete(value)
    node_to_delete = find(value)

    #if we didn't find that value, we're done
    return unless node_to_delete

    #if we delete a node, have have to replace it with the max from its
    #left child or the min from its right child. if it has no children,
    #whatever just delete it

    parent_of_deleted_node = node_to_delete.parent

    #figure out if node_to_delete left or right child of its parent
    left = false
    right = false
    if parent_of_deleted_node #ie, we're not at the root
      if parent_of_deleted_node.value < node_to_delete.value
        right = true
      else
        left = true
      end
    end

    #find which node to replace it with

    #if node_to_delete was a leaf, just set it to be nil
    if node_to_delete.left.nil? && node_to_delete.right.nil?
      node_to_delete = nil
      @node_count -= 1
      return

    #if node_to_delete has a left child, get the max thing and replace
    #if it doesn't have a left but has a right, get its min
    elsif node_to_delete.left
      #find max
      replacement_node = node_to_delete.left
      while replacement_node.right
        replacement_node = replacement_node.right
      end
    else
      #find min
      replacement_node= node_to_delete.right
      while replacement_node.left
        replacement_node = replacement_node.left
      end
    end
    #set replacement value, and delete replacement_node
    node_to_delete.value = replacement_node.value
    replacement_node = nil
    @node_count -= 1
  end

  def getRandomNode
    #pick random number from 0 to @node_count - 1
    #stop dfs after that many moves
    raise 'tree empty' if @node_count == 0
    moves = rand(0...@node_count)
    moves_made = 0

    node_stack = [@root]
    until moves_made == moves
      current_node = node_stack.pop
      node_stack.push(current_node.left) if current_node.left
      node_stack.push(current_node.right) if current_node.right
      moves_made += 1
    end

    p node_stack.pop.value
  end

  def display
    raise 'tree empty' if @node_count == 0
    print in_order_traversal(@root).map { |node| node.value }
  end

  def in_order_traversal(node)
    return [] if node.nil?
    in_order_traversal(node.left) + [node] + in_order_traversal(node.right)
  end

end


tree = BinaryTree.new

tree.insert(5)
tree.insert(3)
tree.insert(2)
tree.insert(4)
tree.insert(10)
tree.insert(7)
tree.insert(15)
tree.insert(17)
tree.insert(12)
tree.insert(8)
tree.getRandomNode
