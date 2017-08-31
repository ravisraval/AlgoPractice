# You have a linked list ↴ and want to find the kkth to last node.
# Write a function kth_to_last_node() that takes an integer kk and the head_node of a singly-linked list, and returns the kkth to last node in the list.
#
# For example:

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

def kth_to_last_node(k, head_node)
  current_node = head_node
  runner = head_node

  i = 0
  while i < k
    runner = runner.next
    i += 1
  end


  until runner == nil
    current_node = current_node.next
    runner = runner.next
  end
  current_node

end


a = LinkedListNode.new("Angel Food")
b = LinkedListNode.new("Bundt")
c = LinkedListNode.new("Cheese")
d = LinkedListNode.new("Devil's Food")
e = LinkedListNode.new("Eccles")

a.next = b
b.next = c
c.next = d
d.next = e

p kth_to_last_node(2, a)
# returns the node with value "Devil's Food" (the 2nd to last node)
