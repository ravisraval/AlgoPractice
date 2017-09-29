class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def merge_two_lists(l1, l2)
      dummy_head = ListNode.new(0)
  latest_node = dummy_head
  l1_latest = l1
  l2_latest = l2

  while l2_latest && l1_latest
    if l1_latest.val < l2_latest.val
      latest_node.next = l1_latest
      latest_node = latest_node.next
      l1_latest = l1_latest.next
    else
      latest_node.next = l2_latest
      latest_node = latest_node.next
      l2_latest = l2_latest.next
    end
  end

  latest_node.next = l1_latest if l1_latest
  latest_node.next = l2_latest if l2_latest

  dummy_head.next


end
