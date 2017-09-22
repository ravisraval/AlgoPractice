#An efficient way to get all primes within some bounds


def get_primes(max)
  #get a list of possibilities, just odds for a little better space
  possibilities = [2]
  i = 3
  while i < max
    possibilities.push(i)
    i += 2
  end

#inc
end
