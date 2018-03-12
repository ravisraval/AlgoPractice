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
def reverse_k_group(head, k)
  length = 0

  curr = head
  while curr
    length += 1
    curr = curr.next
  end
  return head if length / k == 0

  curr_node = head
  fake_starter = ListNode.new(0)
  fake_starter.next = head

  next_node = nil
  prev = fake_starter

  (length / k).times do |time|
    new_head, tail, next_node = reverse_k_nodes(curr_node, k)
    prev.next = new_head
    prev = tail
    curr_node = next_node
  end
  prev.next = next_node
  fake_starter.next


end

def reverse_k_nodes(root, k)
  prev = nil
  curr = root

  k.times do |time|
    tmp_next = curr.next
    curr.next = prev

    prev = curr
    curr = tmp_next
  end

  head = prev
  tail = root
  next_node = curr

  [head, tail, next_node]
end
