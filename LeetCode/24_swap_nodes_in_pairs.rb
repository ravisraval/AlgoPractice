# Given a linked list, swap every two adjacent nodes and return its head.
#
# For example,
# Given 1->2->3->4, you should return the list as 2->1->4->3.
#
# Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
#

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  fake_start = ListNode.new(0)
  fake_start.next = head

  prev = fake_start
  current_node = head

  while current_node
    if current_node.next
      temp_2next = current_node.next.next
      prev.next = current_node.next
      prev.next.next = current_node
      current_node.next = temp_2next
      prev = current_node
      current_node = temp_2next
    else
      break
    end
  end
  fake_start.next
end
