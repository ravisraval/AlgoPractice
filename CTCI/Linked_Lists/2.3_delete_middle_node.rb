# Implement an algo to delete a node in the middle (i.e., any node
# but the first and last node, not necessarily the exact middle) of a
# singly linked list, given only access to that node.
#
# EXAMPLE
# Input : the node c from the linked list a->b->c->d->e->f
# Result: nothing is returned, but the new linked list looks like
#         a->b->d->e->f

require_relative 'linked_list_node'
#just change c to be d, and d to be e, an e to be f
#actually this solution is dumb. no need to move them all over. instead, see blow
def dumb_delete_middle_node(node_to_delete)

  current_node = node_to_delete

  while current_node.next
    puts "current_node: #{current_node.value}"
    puts "current_node.next: #{current_node.next.value}"
    current_node.value = current_node.next.value

    if current_node.next.next
      current_node = current_node.next
    else
      current_node.next = nil
    end
  end

end

def better_delete(node_to_delete)
  node_to_delete.value = node_to_delete.next.value

  if node_to_delete.next.next
    node_to_delete.next = node_to_delete.next.next
  else
    node_to_delete.next = nil
  end
end

first = Node.new(1)
second = Node.new(2)
third = Node.new(3)
fourth = Node.new(4)
fifth = Node.new(5)
sixth = Node.new(6)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
# fifth.next = sixth

# dumb_delete_middle_node(third)
better_delete(third)
p first
