Link = Struct.new(:key, :val, :next, :prev)

class LinkedList
  attr_reader :head

  def initialize
  end

  def insert(key, val)
    if head.nil?
      @head = Link.new(key, val)
    else
      curr_node = @head
      while curr_node.next
        curr_node = curr_node.next
      end
      curr_node.next = Link.new(key, val, nil, curr_node)
    end
  end

  def get(key)
    curr_node = head
    while curr_node
      return curr_node.val if curr_node.key == key
      curr_node = curr_node.next
    end
  end

  def include?(key)
    curr_node = head
    while curr_node
      return true if curr_node.key == key
      curr_node = curr_node.next
    end
    false
  end

  def remove(key)
    curr_node = head
    while curr_node
      if curr_node.key == key
        prev = curr_node.prev
        next_node = curr_node.next
        prev.next = next_node
        next_node.prev = prev
        return
      else
        curr_node = curr_node.next
      end
    end
  end

  def each
  end
end
