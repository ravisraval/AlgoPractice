class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
      @value = value
      @next  = nil
  end

end

def delete_node_singly_linked_list(node_to_delete)

  next_node = node_to_delete.next
  two_nodes_after = node_to_delete.next.next

  if next_node && two_nodes_after
    node_to_delete.value = next_node.value
    node_to_delete.next = two_nodes_after
  elsif next_node
    node_to_delete.value = next_node.value
    node_to_delete.next = nil
  else
    node_to_delete.value = nil
  end

end

a = LinkedListNode.new('A')
b = LinkedListNode.new('B')
c = LinkedListNode.new('C')

a.next = b
b.next = c


p delete_node_singly_linked_list(node_to_delete)

p Object.main
