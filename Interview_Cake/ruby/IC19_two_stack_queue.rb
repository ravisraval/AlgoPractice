class Queue

  def initialize
    @in_stack = []
    @out_stack = []
  end

  def enqueue(item)
    @in_stack.push(item)
    item
  end

  def dequeue
    if @out_stack.empty?
      @in_stack.length.times do |t|
        @out_stack.push(@in_stack.pop)

      end

      popped = @out_stack.pop

    else
      popped = @out_stack.pop
    end

    popped
  end

end


q = Queue.new
p q.enqueue(1)
p q.enqueue(2)
p q.enqueue(3)
p q.enqueue(4)
p q.dequeue
p q.dequeue
p q.dequeue
p q.dequeue
p q.enqueue(5)
p q.dequeue
