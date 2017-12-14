def addTwoDigits(n)
  n.to_s.split('').map(&:to_i).reduce(:+)
end
