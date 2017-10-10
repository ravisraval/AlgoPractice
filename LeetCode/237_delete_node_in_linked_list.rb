# Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.
#
# Supposed the linked list is 1 -> 2 -> 3 -> 4 and you are given the third node with value 3, the linked list should become 1 -> 2 -> 4 after calling your function.
#
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node_dumb(node)
  current_node = node

  while current_node.next.next
    current_node.val = current_node.next.val
    current_node = current_node.next
  end
  current_node.val = current_node.next.val
  current_node.next = nil
end


#wait, that's slow! just move pointer over, delete node.. like so


def delete_node(node)

  node.val = node.next.val
  node.next = node.next.next
  nil
end
