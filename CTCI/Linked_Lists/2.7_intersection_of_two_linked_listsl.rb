# Given two singly linked lists, determine IF the two lists intersect.
# Return the intersecting node. Note that intersection is defined based
# on reference, not value.


#so if they intersect, then everything after the intersection will be
# the same. So bounce to the end of each of them, and see if that's the
# same node.
#perhaps this whole time, be reversing

#if the last node is the same, then walk forward until they differ
#not done, something going on with reversing lists. think helper method works though
require_relative 'linked_list_node'
def intersection(first_head, second_head)

  new_first = reverse_return_new_head(first_head)
  new_second = reverse_return_new_head(second_head)
  p new_first
  puts "meow"
  p new_second
  return false if new_second != new_first

  current_first = new_first
  current_second = new_second
  last_intersecting_node = new_first

  while current_first && current_second
    return current_first if current_first.next != current_second.next
    current_first = current_first.next
    current_second = current_second.next
  end

end

def reverse_return_new_head(head_node)
  previous_node = head_node
  current_node = head_node.next

  while current_node
    next_node = current_node.next
    current_node.next = previous_node
    previous_node = current_node
    current_node = next_node
  end
  head_node.next = nil
  previous_node

end

first = Node.new(1)
second = Node.new(2)
third = Node.new(3)
fourth = Node.new(4)
fifth = Node.new(5)
sixth = Node.new(6)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth

other_first = Node.new(7)
other_second = Node.new(8)


other_first.next = other_second
other_second.next = third

p intersection(first, other_first)
