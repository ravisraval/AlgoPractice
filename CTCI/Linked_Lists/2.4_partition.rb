# Write code to partition a linked list around a value x, such that all
# nodes less than x come before all nodes greater than or equal to x.
# If x is contained within the list, the values of x only need to be
# right after the elements less than x (see below). The partition element
# x can apppear anywhere in the "right partition"; it does not need to
# appear between the left and right partitions.
# EXAMPLES
# INPUT: 3 -> 5 -> 8 -> 10 -> 2 -> 1 [partion = 5]
# OUTPUT: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
require_relative 'linked_list_node'
def brute_partion(head_node, partition)

  current_node = head_node
  lower = []
  upper = []
  #separate into nodes less than partition and greater than it
  while current_node
    lower << current_node if current_node.value < partition
    upper << current_node if current_node.value >= partition
    current_node = current_node.next
  end

  #link these, and link the last to the partition
  unless lower.empty?

    lower.each_with_index do |node, idx|
      if idx == lower.length - 1
        node.next = Node.new(partition)
      else
        node.next = lower[idx + 1]
      end
    end
    #link the new parition node with the upper nodes
    lower.last.next.next = upper[0]

  else

    lower[0] = Node.new(partition)
    lower[0].next = upper[0]

  end
  # do same empty thing here
  upper.each_with_index do |node, idx|
    if idx == upper.length - 1
      node.next = nil
    else
      node.next = upper[idx + 1]
    end
  end

  #print list
  lower[0]

end


def better_partition(head_node, partition)
  #make a node with the partition
  #iterate through nodes
  #if value is less, append it to the tail of the beginning
  #otherwise, append it to tail of partition

  false_starter_node = Node.new(0) #value doesn't matter
  last_lower_node = false_starter_node
  partition_node = Node.new(partition)
  last_upper_node = partition_node

  current_node = head_node

  while current_node

    if current_node.value < partition
      last_lower_node.next = current_node
      last_lower_node = current_node
    else
      last_upper_node.next = current_node
      last_upper_node = current_node
    end

    current_node = current_node.next

  end

  #link lower to upper
  last_lower_node.next = partition_node
  last_upper_node.next = nil

  false_starter_node.next
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

p better_partition(first, 0)
