# Implement a function to check if a linked list is a palindrome
# 1 2 3 2 1
# 1 2 3 3 2 1
require_relative '../Stacks_and_Queues/basic_stack'
require_relative 'linked_list_node'
def is_palindrome?(head_node)
  #find length
  #reverse the second half (what's the time complexity here)
  #send a runner halfway and check

  #doing this with a stack instead
  length = 0
  current_node = head_node

  while current_node
    length += 1
    current_node = current_node.next
  end

  value_stack = Stack.new

  #place the first half into the stack
  current_node = head_node
  idx = 0
  while idx < length / 2
    value_stack.push(current_node.value)
    current_node = current_node.next
    idx += 1
  end

  if length.odd? #skip middle if odd
    current_node = current_node.next
  end

  while current_node
    return false unless current_node.value == value_stack.pop
    current_node = current_node.next
  end

  #we should have gone through everything
  return false unless value_stack.isEmpty
  true
end

first = Node.new(1)
second = Node.new(2)
third = Node.new(3)
fourth = Node.new(3)
fifth = Node.new(2)
sixth = Node.new(1)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth

p is_palindrome?(first)
