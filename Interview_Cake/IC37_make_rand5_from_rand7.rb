# You have a function rand7() that generates a random integer from 1 to 7. Use it to write a function rand5() that generates a random integer from 1 to 5.
# rand7() returns each integer with equal probability. rand5() must also return each integer with equal probability.

def rand5
    x = 0
    until x.between?(1, 5)
      x = rand(1..7)
    end
    x
end



p rand5
