class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end

end
#uses hash for O(n) time and space
def list_cycles?(head_node)

  node_hash = Hash.new([])

  current_node = head_node
  while true
    return true if node_hash[current_node.value].include?(current_node)
    return false unless current_node.next
    node_hash[current_node.value].push(current_node)
    current_node = current_node.next
  end
end

#uses runner node that steps twice for O(n) time and O(1) space
def constant_space_list_cycles_runner?(head_node)

  current_node = head_node
  runner_node = head_node
  while true
    return false unless runner_node.next
    runner_node = runner_node.next
    return true if current_node == runner_node

    return false unless runner_node.next
    runner_node = runner_node.next
    current_node = current_node.next
  end
end

a = LinkedListNode.new(1)
b = LinkedListNode.new(2)
c = LinkedListNode.new(3)
d = LinkedListNode.new(1)
e = LinkedListNode.new(2)
f = LinkedListNode.new(3)

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f



p constant_space_list_cycles_runner?(a)
