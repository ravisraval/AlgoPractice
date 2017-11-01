# Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.


# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)

  list = []
  current_node = head
  while current_node
    list.push(current_node.val)
    current_node = current_node.next
  end

  sort_arr_to_bst(list)

end

def sort_arr_to_bst(list)
  return nil if list.empty?
  mididx = list.length / 2

  new_node = TreeNode.new(list[mididx])
  new_node.left = sort_arr_to_bst(list[0...mididx])
  new_node.right = sort_arr_to_bst(list[mididx + 1..-1])
  
  new_node
end
