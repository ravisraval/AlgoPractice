# An animal shelter, which holds only dogs and cats, operates as a queue.
# People must adopt either the 'oldest' (based on arrival time) of all
# animals at the shelter, or they can select whether they would prefer
# a dog or a cat (and will receive the oldest animal of that type).
# They cannot select which specific animal they would like. Create
# the data structures to maintain this system and implement operations
# such as enqueue, dequeueAny, dequeueDog, and dequeueCat. You may use
# the built-in LinkedList data structure. <--no such thing

class Animal

  attr_accessor :next, :name, :next_dog, :next_cat
  attr_reader :type
  def initialize(name, type)
    @name = name
    @type = type
    @next = nil
    @prev = nil
    @next_dog = nil
    @next_cat = nil
  end

  def display
    puts "#{@name} the #{type}"
  end

end

class Shelter

  def initialize
    @animals = []
    @oldest_cat = nil
    @oldest_dog = nil
    @oldest_animal = nil
    @newest_animal = nil
  end

  def enqueue(animal)
    #deal with type specific stuff
    if animal.type == 'Dog'
      #if there's already a dog, set its next to be the new dog
      if @oldest_dog
        @oldest_dog.next_dog = animal
      else
        @oldest_dog = animal
      end
    else
      if @oldest_cat
        @oldest_cat.next_cat = animal
      else
        @oldest_cat = animal
      end
    end

    #deal with universal stuff
    if @animals.empty?
      @animals.push(animal)
      @oldest_animal = animal
    else
      @newest_animal.next = animal
    end
    @newest_animal = animal

  end

  def dequeueAny
    return 'No animals' if @animals.empty?

    dequeued_animal = @oldest_animal

    #deal with universal
    @oldest_animal = @oldest_animal.next

    #deal with specific
    if dequeued_animal.type == 'Dog'
      @oldest_dog = dequeued_animal.next_dog
    else
      @oldest_cat = dequeued_animal.next_cat
    end

    dequeued_animal
  end

  def dequeueDog
    
  end


end
mec = Animal.new('Mec', 'Cat')
ami = Animal.new('Ami', 'Cat')
woof = Animal.new('Bow', 'Dog')
a = Shelter.new
a.enqueue(mec)
a.enqueue(ami)
a.enqueue(woof)
p a.dequeueAny
p a.dequeueAny
p a.dequeueAny
