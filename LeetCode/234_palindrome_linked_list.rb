# Given a singly linked list, determine if it is a palindrome.
#
# Follow up:
# Could you do it in O(n) time and O(1) space?



# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
#alternatively, reverse the first half, then compare to second half with two pointers
def is_palindrome(head)
  nums = []
  curr_node = head
  while curr_node
    nums.push(curr_node.val)
    curr_node = curr_node.next
  end
  nums == nums.reverse
end
