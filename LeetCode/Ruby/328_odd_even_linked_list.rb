# Given a singly linked list, group all odd nodes together followed by the even nodes. Please note here we are talking about the node number and not the value in the nodes.
#
# You should try to do it in place. The program should run in O(1) space complexity and O(nodes) time complexity.
#
# Example:
# Given 1->2->3->4->5->NULL,
# return 1->3->5->2->4->NULL.
#
# Note:
# The relative order inside both the even and odd groups should remain as it was in the input.
# The first node is considered odd, the second node even and so on ...

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def odd_even_list(head)
  fake_odd_node = ListNode.new(1)
  fake_even_node = ListNode.new(1)

  last_odd = fake_odd_node
  last_even = fake_even_node

  idx = 1
  current_node = head

  while current_node
      puts current_node.val
    if idx.odd?
      last_odd.next = current_node
      last_odd = current_node
    else
      last_even.next = current_node
      last_even = current_node
    end
    current_node = current_node.next
    idx += 1
  end

  last_even.next = nil
  last_odd.next = fake_even_node.next
  fake_odd_node.next
end
