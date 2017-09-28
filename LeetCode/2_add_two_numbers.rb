# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @nect = nil
  end
end

def add_two_numbers(l1, l2)

  l1_curr = l1
  l2_curr = l2
  remainder = 0

  last_node = nil

  while l1_curr || l2_curr || remainder != 0

    if l1_curr && l2_curr
      res = l1_curr.val + l2_curr.val + remainder
      l1_curr = l1_curr.next
      l2_curr = l2_curr.next
    elsif l2_curr
      res = l2_curr.val + remainder
      l2_curr = l2_curr.next
    elsif l1_curr
      res = l1_curr.val + remainder
      l1_curr = l1_curr.next
    else
      res = remainder
    end

    if res >= 10
      res -= 10
      remainder = 1
    else
      remainder = 0
    end

    new_node = ListNode.new(res)

    if last_node
      last_node.next = new_node
      last_node = new_node
    else
      first_node = new_node
      last_node = new_node
    end

  end

  first_node
end


a = ListNode.new(2)
a.next = ListNode.new()
