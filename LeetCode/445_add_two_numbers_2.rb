# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  digits1 = []
  digits2 = []
  curr1 = l1
  curr2 = l2

  while curr1 || curr2
    if curr1
      digits1.unshift(curr1.val)
      curr1 = curr1.next
    end
    if curr2
      digits2.unshift(curr2.val)
      curr2 = curr2.next
    end
  end

  curr_node = nil
  idx = 0
  carry1 = false

  until digits1.empty? && digits2.empty?
    curr_sum = 0
    curr_sum += digits1.shift if digits1[0]
    curr_sum += digits2.shift if digits2[0]

    curr_sum += 1 if carry1
    if curr_sum > 9
      carry1 = true
      curr_sum -= 10
    else
      carry1 = false
    end

    new_node = ListNode.new(curr_sum)
    new_node.next = curr_node
    curr_node = new_node
  end

  if carry1
    new_node = ListNode.new(1)
    new_node.next = curr_node
    curr_node = new_node
  end

  new_node
end
