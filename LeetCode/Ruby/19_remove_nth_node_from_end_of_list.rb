# Given a linked list, remove the nth node from the end of list and return its head.
#
# For example,
#
#    Given linked list: 1->2->3->4->5, and n = 2.
#
#    After removing the second node from the end, the linked list becomes 1->2->3->5.
# Note:
# Given n will always be valid.
# Try to do this in one pass.


def remove_nth_from_end(head_node, n)

  starter = head_node
  runner = head_node
  n.times do |time|
    runner = runner.next
  end

  if runner.nil?
      return head_node.next
  end

  while runner.next
    starter = starter.next
    runner = runner.next
  end

  starter.next = starter.next.next

  head_node

end



end
