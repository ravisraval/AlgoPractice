# Given a list, rotate the list to the right by k places, where k is non-negative.
#
#
# Example:
#
# Given 1->2->3->4->5->NULL and k = 2,
#
# return 4->5->1->2->3->NULL.
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
    return nil if head.nil?
    return head if k == 0

    curr = head
    length = 1
    while curr.next
        length += 1
        curr = curr.next
    end
    return head if length == 1

    last = curr

    k %= length
    #go the other way
    k = length - k
    curr_head = head
    k.times do |time|
        next_head = curr_head.next
        last.next = curr_head
        last = curr_head
        curr_head = next_head
    end

    last.next = nil
    curr_head
end
