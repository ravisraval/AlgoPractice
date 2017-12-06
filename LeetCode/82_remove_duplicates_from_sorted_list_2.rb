# Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
#
# For example,
# Given 1->2->3->3->4->4->5, return 1->2->5.
# Given 1->1->1->2->3, return 2->3.
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
def delete_duplicates(head)
  return nil if head.nil?

  dummy_start = ListNode.new(0)

  dummy_start.next = head
  seen = Hash.new(0)
  curr_node = head

  while curr_node
    seen[curr_node.val] += 1
    curr_node = curr_node.next
  end

  seen.reject! { |h, k| k > 1}

  last_good_node = dummy_start
  curr_node = head
  while curr_node
    if seen.has_key?(curr_node.val)
      last_good_node = curr_node
    else
      last_good_node.next = curr_node.next
    end
    curr_node = curr_node.next
  end
  
  dummy_start.next
end
