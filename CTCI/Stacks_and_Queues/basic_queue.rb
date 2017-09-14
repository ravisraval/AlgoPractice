class Queue

  def initialize
    @length = 0
    @store = []
  end

  def add(item)
    @length += 1
    @store.push(item)
  end

  def remove
    if @length == 0
      raise 'Nothing to remove'
    else
      @length -= 1
      @store.shift
    end
  end

  def peek
    @store.first
  end

  def isEmpty
    @length == 0
  end
  
end
