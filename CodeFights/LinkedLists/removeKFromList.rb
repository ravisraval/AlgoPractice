# Definition for singly-linked list:
# class ListNode
#   attr_accessor :value, :next
#   def initialize(val)
#     @value = val
#     @next = nil
# end
#
def removeKFromList(l, k)
    dummy_head = ListNode.new(0)
    dummy_head.next = l
    prev = dummy_head
    current = l

    while current
        if current.value == k
            prev.next = current.next
        else
            prev = current
        end
        current = current.next
    end
    dummy_head.next
end
