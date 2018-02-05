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
def reverse_list(head)
    return [] if head.nil?
    curr = head
    prev = nil

    while curr.next
        next_node = curr.next
        curr.next = prev

        prev = curr
        curr = next_node
    end

    curr.next = prev
    curr
end
