# Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
#
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)

    nodes = Hash.new { |h, k| h[k] = []}
    lists.compact!
    false_starter_node = ListNode.new(0)

    lists.each do |list_node|
        current_node = list_node
        while current_node
            nodes[current_node.val].push(current_node)
            current_node = current_node.next
        end
    end

    sorted_keys = nodes.keys.sort
    prev_node = false_starter_node
    sorted_keys.each do |key|
        nodes[key].each do |curr_node|
            prev_node.next = curr_node
            prev_node = curr_node
        end
    end

  false_starter_node.next
end


a = ListNode.new(1)
b = ListNode.new(3)
c = ListNode.new(5)
x = ListNode.new(2)
y = ListNode.new(4)
z = ListNode.new(6)

a.next = b
b.next = c
x.next = y
y.next = z

p merge_k_lists([a,x])
