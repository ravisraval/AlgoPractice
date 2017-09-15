# Implement a MyQueue class which implements a queue with two stacks.

require_relative 'basic_stack'

class MyQueue

  def initialize
    @in_stack = Stack.new
    @out_stack = Stack.new
  end

  def enqueue(item)
    @in_stack.push(item)
  end

  def dequeue
    if @out_stack.isEmpty
      if @in_stack.isEmpty
        raise 'Queue is empty'
      else
        until @in_stack.isEmpty
          @out_stack.push(@in_stack.pop)
        end
      end
    end
    @out_stack.pop
  end

  def display_all
    puts "In_stack: #{@in_stack.display}"
    puts "out_stack: #{@out_stack.display}"
  end
end

a = MyQueue.new
a.display_all
p a.enqueue(1)
p a.enqueue(2)
p a.dequeue
a.enqueue(3)
a.display_all
p a.dequeue
p a.dequeue
a.enqueue(3)
a.enqueue(3)
a.enqueue(3)
a.enqueue(3)
a.enqueue(3)
a.enqueue(3)
p a.dequeue
a.enqueue(4)
a.enqueue(5)
a.display_all
p a.dequeue
a.display_all
p a.dequeue
a.display_all
p a.dequeue
a.display_all
p a.dequeue
a.display_all
p a.dequeue
a.display_all
p a.dequeue
a.display_all
