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

def test
  hash = Hash.new(0)
  i = 0
  while i < 10000
    hash[prob] += 1
    i += 1
  end
  hash


end

p test
