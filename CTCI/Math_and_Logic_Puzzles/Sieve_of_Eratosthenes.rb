#An efficient way to get all primes within some bounds


def get_primes(max)
  #get a list of possibilities, just odds for a little better space
  possibilities = [2]
  i = 3
  while i < max
    possibilities.push(i)
    i += 2
  end






end
idx = 1
while idx < 100
  perc = idx.fdiv(100)
  puts perc
  if (perc * perc * (1 - perc) * 3 + perc * 3).round == perc.round
    puts perc * 100
  end
  idx += 1
end
# if prob is 70%
#
#   Make Make Miss
#   .7 * .7 * .3 = .147 * 3 +
#   .7 * .7 * .7
#
# b b b
# b b g
# b g b
# b g g
# g b b
# g b g
# g g b
# g g g
