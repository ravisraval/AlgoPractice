# Remove all elements from a linked list of integers that have value val.
#
# Example
# Given: 1 --> 2 --> 6 --> 3 --> 4 --> 5 --> 6, val = 6
# Return: 1 --> 2 --> 3 --> 4 --> 5


# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  current_node = head
  fake_starter = ListNode.new(0)
  fake_starter.next = current_node
  prev = fake_starter

  while current_node
    if current_node.val == val
      prev.next = current_node.next
    else
        prev = current_node
    end
    current_node = current_node.next
  end

  fake_starter.next
end
