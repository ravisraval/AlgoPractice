def isSum(value)
  num = 0
  45.times do |n|
    num += n
    return true if num == value
    return false if num > value
  end
false
end
