class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' if num > @store.length - 1 || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end
end


class IntSet
  def initialize(length = 20)
    @store = Array.new(length) { Array.new }
  end

  def insert(num)
    @store[num % 20].push(num)
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store[num % 20].include?(num)
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(length = 20)
    @store = Array.new(length, false)
    @count = 0
  end

  def insert(num)
    @count += 1
    resize! if count == @store.length
    @store[num % @store.length] = true
  end

  def remove(num)
    @store[num % @store.length] = false
    @count -= 1
  end

  def include?(num)
    @store[num % @store.length]
  end

  private

  def resize!
    new_store = Array.new(@store.length * 2, false)
    @store.each_with_index do |bool, idx|
      new_store[idx] = bool
    end
    @store = new_store
  end
end
