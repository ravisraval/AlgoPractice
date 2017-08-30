class MaxStack

  # initialize an empty array
  def initialize
    @items = []
    @max = nil
  end

  # push a new item to the last index
  def push(item)
      @items.push(item)
      @max = item if @max.nil? || item > @max
  end
  # remove the last item
  def pop()
      # if the stack is empty, return nil
      # (it would also be reasonable to throw an exception)
      if @items.empty?
          return nil
      end
      return @items.pop()
  end

  # see what the last item is
  def peek()
      if @items.empty?
          return nil
      end
      return @items[-1]
  end

  def get_max
    puts "retrieving max"
    return @max if @max
    return "Stack is empty"
  end
end



matt = MaxStack.new

p matt.get_max
p matt.push(1)
p matt.get_max
p matt.push(4)
p matt.push(8)
p matt.get_max
p matt.push(12)
p matt.get_max
p matt.push(100)
