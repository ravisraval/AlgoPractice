# Imagine a (literal) stack of plates. If the stack gets too high,
# it might topple. Therefore, irl, we would likely start a new stack
# when the previous stack exceeds some threshold. Implement a data
# structure SetOfStacks that mimics this. SetOfStacks should be composed of
# several stacks and should create a new stack once the previous one
# exceeds capacity. SetOfStacks.push and SetOfStacks.pop should function
# just as a single stack functions.
#
#
# FOLLOW UP:
# Implement a function popAt(index) which performs a pop operation on a
# specific sub-stack.


require_relative 'basic_stack'

class SetOfStacks

  def initialize(threshold)
    @stacks = [Stack.new]
    @threshold = threshold
    @last_stack_idx = 0
  end

  def generate_stack
    @stacks.push(Stack.new)
  end

  def push(item)
    @stacks[@last_stack_idx].push(item)
    if @stacks[@last_stack_idx].length == @threshold
      generate_stack
      @last_stack_idx += 1
    end
  end

  def pop
    popped = @stacks[@last_stack_idx].pop
    if @stacks[@last_stack_idx].isEmpty
      @stacks.pop
      @last_stack_idx -= 1
    end
    popped
  end

  def popAt(stack_index)
    popped = @stacks[stack_index].pop
    if @stacks[stack_index].isEmpty
      @stacks.delete_at(stack_index)
      @last_stack_idx -= 1
    end
    popped
  end

  def isEmpty
    @stacks[0].isEmpty == true
  end

  def display_all
    @stacks.map { |stack| stack.display }
  end

end


a = SetOfStacks.new(3)
a.push(1)
a.push(1)
a.push(1)
a.push(2)
p a.display_all
a.push(2)
a.push(2)
a.push(3)
p a.popAt(1)
p a.display_all
