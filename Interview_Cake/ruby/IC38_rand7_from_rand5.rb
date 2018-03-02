def prob
  result = rand(1..5) * rand(1..5)
  return 1 if result == 2
  return 2 if result == 3
  return 3 if result == 5
  return 4 if result == 6
  return 5 if result == 8
  return 6 if result == 10
  return 7 if result == 12
  prob
end


def rand7

  while true

      # do our die rolls
      roll1 = rand(1..5)
      roll2 = rand(1..5)

      outcome_number = (roll1-1) * 5 + (roll2-1) + 1

      # if we hit an extraneous
      # outcome we just re-roll
      if outcome_number > 21
          next
      end

      # our outcome was fine. return it!
      return outcome_number % 7 + 1
  end
end

def test
  hash = Hash.new(0)
  i = 0
  while i < 10000
    hash[rand7] += 1
    i += 1
  end
  hash


end
p test   
