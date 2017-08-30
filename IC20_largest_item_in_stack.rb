class MaxStack

  # initialize an empty array
  def initialize
    @items = []
    @max_stack = []
  end

  # push a new item to the last index
  def push(item)
    @items.push(item)
    if @max_stack.empty? || @max_stack.last < item
      @max_stack.push(item)
    end
  end
  # remove the last item
  def pop()
    # if the stack is empty, return nil
    # (it would also be reasonable to throw an exception)
    if @items.empty?
      return nil
    end

    popped = @items.pop
    @max_stack.pop if popped == @max_stack.last

    return popped
  end

  # see what the last item is
  def peek()
    if @items.empty?
        return nil
    end
    return @items[-1]
  end

  def get_max
    @max_stack.last
  end
end



matt = MaxStack.new

p matt.push(12)
p matt.get_max
p matt.push(100)
p matt.get_max
p matt.pop
p matt.get_max
p matt.push(5)
p matt.get_max
p matt.push(200)
p matt.get_max
p matt.pop
p matt.get_max
