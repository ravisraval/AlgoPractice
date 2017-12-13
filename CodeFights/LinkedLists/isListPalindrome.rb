# Definition for singly-linked list:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end
#
def isListPalindrome(l)
  res = []
    curr = l
    while curr
        res.push(curr.value)
        curr = curr.next
    end
    res == res.reverse
end
