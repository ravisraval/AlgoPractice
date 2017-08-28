def highest_prod_of_three(arr)
  highest_prod = 0
  arr.sort!

  low_prod = arr[0] * arr[1]
  high_prod = arr[-2] * arr[-3]

  if low_prod > high_prod
    return low_prod * arr[-1]
  end

  high_prod * arr[-1]
end

def faster_prod(arr)
  highest = arr[0]
  second_highest = nil
  third_highest = nil
  lowest = arr[0]
  second_lowest = nil

  arr[1..-1].each do |num|

    if num >= highest
      third_highest = second_highest
      second_highest = highest
      highest = num
    elsif num >= second_highest
      third_highest = second_highest
      second_highest = num
    elsif num > third_highest
      third_highest = num
    end

    if num <= lowest
      second_lowest = lowest
      lowest = num
    elsif second_lowest.nil? || num < second_lowest
      second_lowest = num
    end

  end

  low_prod = lowest * second_lowest
  high_prod = second_highest * third_highest

  if low_prod > high_prod
    return low_prod * highest
  end

  high_prod * highest
end

p "should be -50 #{faster_prod([-10, -5, -1])}"
p "should be 50 #{faster_prod([-10, -5, 1])}"
p "should be 300 #{faster_prod([-10, -5, 6])}"
p "should be 1200 #{faster_prod([-8, -5, 6, 10, 20])}"
p "should be 1200 #{faster_prod([-10, 5, 6, 10, 20])}"
