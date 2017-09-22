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




require_relative 'binary_node'

class BinaryTree


  def initialize
    @root = nil
  end

  def insert(value)
    #if we have nothing so far
    if @root.nil?
      @root = BinaryTreeNode.new(value)
      return @root
    end



  end

  def find(value)

  end

  def delete(value)

  end

  def getRandomNode

  end


end
