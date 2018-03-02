class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end
end

# Write a function for reversing a linked list. ↴ Do it in-place. ↴
#
# Your function will have one input: the head of the list.
#
# Your function should return the new head of the list.
#
# Here's a sample linked list node class:


def reverse_singly_linked_list(head)
  current_node = head
  previous_node = nil

  until current_node.next == nil
    next_node = current_node.next #next_node is b | next_node = c

    current_node.next = previous_node #remove a's next | b's next = a

    previous_node = current_node #previous_node = a | previous_node = b
    current_node = next_node #current_node = b | current_node
  end

  current_node.next = previous_node #finish it off with e's next = d

  current_node

end

# a -> b -> c -> d -> e

a = LinkedListNode.new('A')
b = LinkedListNode.new('B')
c = LinkedListNode.new('C')
d = LinkedListNode.new('D')
e = LinkedListNode.new("E")
f = LinkedListNode.new("F")
# g = LinkedListNode.new("G")

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
# f.next = g

p reverse_singly_linked_list(a)
