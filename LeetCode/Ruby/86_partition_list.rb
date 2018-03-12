# Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
#
# You should preserve the original relative order of the nodes in each of the two partitions.
#
# For example,
# Given 1->4->3->2->5->2 and x = 3,
# return 1->2->2->4->3->5.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
    small_fake = ListNode.new(0)
    big_fake = ListNode.new(0)

    curr_small = small_fake
    curr_big = big_fake

    curr = head
    count = 0
    while curr
        if curr.val >= x
            curr_big.next = curr
            curr_big = curr
        else
            curr_small.next = curr
            curr_small = curr
        end
        curr = curr.next
        count += 1
    end
    curr_big.next = nil
    curr_small.next = big_fake.next
    small_fake.next
end
