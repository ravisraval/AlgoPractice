class MinHeap

  def initialize
    @store = []
  end

  def peek_min
    @store[0]
  end

  def insert(num)
    @store.push(num)
    curr_idx = @store.length - 1

    return if curr_idx == 0

    if curr_idx.even?
      parent_idx = (curr_idx - 2) / 2
    else
      parent_idx = (curr_idx - 1) / 2
    end

    while num < @store[parent_idx]
      @store[curr_idx], @store[parent_idx] =
      @store[parent_idx], @store[curr_idx]
      curr_idx = parent_idx

      break if curr_idx == 0

      if curr_idx.even?
        parent_idx = (curr_idx - 2) / 2
      else
        parent_idx = (curr_idx - 1) / 2
      end

    end
  end

  def get_and_remove_min
    min = @store[0]

    @store[0] = @store.pop

    curr_idx = 0

    left_child_idx = 1
    right_child_idx = 2

    left_child = @store[left_child_idx]
    right_child = @store[right_child_idx]

    return min if left_child.nil? && right_child.nil?

    while (left_child && @store[curr_idx] > left_child) ||
          (right_child && @store[curr_idx] > right_child)


      if right_child.nil? || left_child < right_child
        @store[curr_idx], @store[left_child_idx] =
        @store[left_child_idx], @store[curr_idx]
        curr_idx = left_child_idx
      else
        @store[curr_idx], @store[right_child_idx] =
        @store[right_child_idx], @store[curr_idx]
        curr_idx = right_child_idx
      end

      left_child_idx = curr_idx * 2 + 1
      right_child_idx = curr_idx * 2 + 2

      left_child = @store[left_child_idx]
      right_child = @store[right_child_idx]

    end

    min
  end

end
