# How wouldy you design a stack which, in addition to push and pop,
# has a function min which returns the minimum element?
# Push, pop, and min should all operate in O(1) time.



class MinStack

  def initialize
    @store = []
    @mins = []
  end

  def push(num)
    @mins.push(num) if @mins.empty? || num <= @mins.last
    @store.push(num)
  end

  def pop
    popped = @store.pop
    @mins.pop if popped == @mins.last
    popped
  end

  def min
    return 'Empty stack' if @mins.empty?
    @mins.last
  end

end

x = MinStack.new
p x.push(5)
p x.min
p x.push(3)
p x.push(1)
p x.min
p x.push(4)
p x.min
p x.pop
p x.min
p x.pop
p x.min
