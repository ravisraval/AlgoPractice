class Stack

  attr_reader :length

  def initialize
    @store = []
    @length = 0
  end

  def push(el)
    @store.push(el)
    @length += 1
  end

  def pop
    if @length == 0
      raise 'Nothing in stack'
    else
      popped = @store.pop
      @length -= 1
      popped
    end
  end

  def peek
    @store[-1]
  end

  def isEmpty
    @length == 0
  end

  def display
    @store
  end

end
