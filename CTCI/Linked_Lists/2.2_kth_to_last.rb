#singly linked list, given head, find kth to last

require_relative 'linked_list_node'
def kth_to_last(head, k)
  current_node = head
  runner = head

  (k-1).times do |time|
    return 'Not enough nodes' unless runner.next
    runner = runner.next
  end

  while runner.next
    current_node = current_node.next
    runner = runner.next
  end

  current_node.value

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
fifth.next = sixth

p kth_to_last(first, 3)
p kth_to_last(first, 1)
