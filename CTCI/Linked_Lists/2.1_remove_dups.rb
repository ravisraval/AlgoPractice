#Write code to remove duplicates from an unsorted linked list
#FOLLOW UP: how would you solve this problem if a temporary buffer
#was not allowed?


require_relative 'linked_list_node'
require 'set'
#using a singly linked list

def remove_dups(head_node)

  p head_node

  seen_node_values = Set.new
  seen_node_values << head_node.value

  current_node = head_node.next
  previous_node = head_node

  while current_node

    if seen_node_values.include?(current_node.value)

      if current_node.next
        previous_node.next = current_node.next
      else #we're on the last one
        previous_node.next = nil
      end

    end

    seen_node_values << current_node.value

    previous_node = current_node
    current_node = current_node.next
  end

p head_node

end


first = Node.new(1)
second = Node.new(2)
third = Node.new(3)
fourth = Node.new(1)
fifth = Node.new(4)
sixth = Node.new(3)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth

remove_dups(first)
