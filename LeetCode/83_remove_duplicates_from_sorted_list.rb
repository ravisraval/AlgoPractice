# Given a sorted linked list, delete all duplicates such that each element appear only once.
#
# For example,
# Given 1->1->2, return 1->2.
# Given 1->1->2->3->3, return 1->2->3.

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
def delete_duplicates(head)
  return nil if head.nil?
  current_node = head
  while current_node.next
    if current_node.next.val == current_node.val
      if current_node.next.next
        current_node.next = current_node.next.next
      else
        current_node.next = nil
          break
      end
    else
        current_node = current_node.next
    end
  end
  head
end
