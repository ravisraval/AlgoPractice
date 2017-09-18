# Write a program to sort a stack such that the smallest items
#  are on the top. You can use an additional temporary stack,
#  but you may not copy the elements into any other data structure
#  (such as an array). The stack supports the following operations:
#  push, pop, peek, and isEmpty.

require_relative 'basic_stack'

def sort_stack(stack)

  secondary_stack = Stack.new
  sorted = false
  until sorted
    sorted = true

    until stack.isEmpty
      popped = stack.pop
      if secondary_stack.isEmpty ||
        popped > secondary_stack.peek ||
        popped == secondary_stack.peek
        secondary_stack.push(popped)
      else
        sorted = false
        stack.push(secondary_stack.pop)
        secondary_stack.push(popped)
        secondary_stack.push(stack.pop)
      end
    end

    until secondary_stack.isEmpty
      stack.push(secondary_stack.pop)
    end
  end

  stack.display

end


a = Stack.new
a.push(2)
a.push(4)
a.push(1)
a.push(3)
a.push(-5)
a.push(0)
a.push(5)
p sort_stack(a)
