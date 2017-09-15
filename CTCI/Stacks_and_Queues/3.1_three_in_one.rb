# describe how you could use a single array to implement three stacks
#incomplete
#this would be above the difficulty of an interview problem assuming
#you need dynamically sized stacks

class ThreeStacks

  def initialize
    @container = []
    @first_stack_start_idx = 0
    @first_stack_length = 0
    @second_stack_start_idx = 1
    @second_stack_length = 0
    @third_stack_start_idx = 2
    @third_stack_length = 0
  end

  def push_1(item)
    #move third stack over
    @container[
      @third_stack_start_idx + 1..
      @third_stack_start_idx + @third_stack_length + 1
    ] = @container[
      @third_stack_start_idx..
      @third_stack_start_idx + @third_stack_length
    ]
    #move second stack over
    @container[
      @second_stack_start_idx + 1..
      @second_stack_start_idx + @second_stack_length + 1
    ] = @container[
      @second_stack_start_idx..
      @second_stack_start_idx + @second_stack_length
    ]

    @container[@first_stack_start_idx + @first_stack_length] = item

    @first_stack_length += 1
    @second_stack_start_idx += 1
    @third_stack_start_idx += 1
    @container
  end

  def push_2(item)
    @container[
      @third_stack_start_idx + 1..
      @third_stack_start_idx + @third_stack_length + 1
    ] = @container[
      @third_stack_start_idx..
      @third_stack_start_idx + @third_stack_length
    ]

    @container[@second_stack_start_idx + @second_stack_length] = item
    @second_stack_length += 1
    @second_stack_start_idx += 1
    @third_stack_start_idx += 1

    @container
  end

  def push_3(item)
    @container[-1] = item
    @third_stack_length += 1
  end

  def display_all
    @container
  end

end

a = ThreeStacks.new
p a.push_1(1)
p a.push_1(1)
p a.push_1(1)
p a.push_2(2)
p a.push_2(2)
p a.push_2(2)
p a.push_1(1)
p a.push_1(1)
p a.push_1(1)
p a.push_1(1)
# p a.display_all
# p a.push_2(2)
# p a.display_all
# p a.display_all
