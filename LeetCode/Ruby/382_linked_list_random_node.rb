# Given a singly linked list, return a random node's value from the linked list. Each node must have the same probability of being chosen.
#
# Follow up:
# What if the linked list is extremely large and its length is unknown to you? Could you solve this efficiently without using extra space?
#
# Example:
#
# // Init a singly linked list [1,2,3].
# ListNode head = new ListNode(1);
# head.next = new ListNode(2);
# head.next.next = new ListNode(3);
# Solution solution = new Solution(head);
#
# // getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
# solution.getRandom();

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

class Solution

=begin
    @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node.
    :type head: ListNode
=end
    def initialize(head)
        @head = head
        @length = get_length
    end

    def get_length
        length = 1
        curr = @head
        while curr.next
            length += 1
            curr = curr.next
        end
        length
    end


=begin
    Returns a random node's value.
    :rtype: Integer
=end
    def get_random()
       steps = rand(@length)
        curr = @head
        steps.times { curr = curr.next }
        curr.val
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(head)
# param_1 = obj.get_random()
