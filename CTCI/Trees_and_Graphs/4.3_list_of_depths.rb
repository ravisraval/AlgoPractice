# Given a binary tree, design an algorithm which creates a linked list
# of all the nodes at each depth (e.g., if you have a tree with depth D,
# you'll have D linked lists).

require_relative 'binary_node'

class Link
  attr_accessor :next
  attr_accessor :value

  def initialize(value)
    @value = value
    @next = nil
  end

end


class LinkedList

  def initialize
    @store = []
    @tail = nil
  end

  def push(link)
    if @store.empty?
      @store.push(link)
      @tail = link
    else
      @tail.next = link
      @tail = link
    end
  end

end


def linked_list_gen(root_node)

  #implement standard bfs, but make a linked list with each level
  #each node brings along its depth
  linked_list_array = []


  queue = [[root_node, 0]]
  until queue.empty?

    current_node, depth = queue.shift

    #if we just got to a new depth, make a linkedlist there
    if linked_list_array[depth].nil?
      linked_list_array[depth] = LinkedList.new
    end


    #make a link from that node and push it onto the linked list
    linked_list_array[depth].push(Link.new(current_node.value))

    queue.push([current_node.left, depth + 1]) if current_node.left
    queue.push([current_node.right, depth + 1]) if current_node.right

  end

  linked_list_array

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


p linked_list_gen(a)
