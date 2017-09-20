# You have two numbers represented by a linked list, where each node contains
# a single digit. The digits are stored in reverse order, such that the
# 1's digit is at the head of the list. Write a function that adds the
# two numbers and returns the sum as a linked list.
#
# EXAMPLE
# INPUT: (7->1->6) + (5->9->2). 617 + 295
# OUTPUT: 2->1->9. That is, 912
#
# FOLLOWUP: Repeat the problem with the digits in reverse order.'

require_relative 'linked_list_node'

def sum_lists(first_head, second_head)

  current_first_list_node = first_head
  current_second_list_node = second_head

  false_starter_node = Node.new(0)
  latest_node = false_starter_node

  remainder = 0

  while current_first_list_node || current_second_list_node || remainder != 0

    if current_first_list_node
      first_value = current_first_list_node.value
    else
      first_value = 0
    end

    if current_second_list_node
      second_value = current_second_list_node.value
    else
      second_value = 0
    end

    new_value = first_value + second_value + remainder

    if new_value > 9
      remainder = new_value.to_s[0].to_i
    else
      remainder = 0
    end

    latest_node.next = Node.new(new_value % 10)
    latest_node = latest_node.next

    if current_first_list_node
      current_first_list_node = current_first_list_node.next
    end
    if current_second_list_node
      current_second_list_node = current_second_list_node.next
    end

  end

  false_starter_node.next
end
first = Node.new(1)
second = Node.new(4)
third = Node.new(3)
fourth = Node.new(4)
fifth = Node.new(5)
sixth = Node.new(6)

first.next = second
second.next = third

fourth.next = fifth
# fifth.next = sixth


p sum_lists(first, fourth)
