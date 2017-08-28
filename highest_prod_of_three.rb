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


p "should be -50 #{highest_prod_of_three([-10, -5, -1])}"
p "should be 50 #{highest_prod_of_three([-10, -5, 1])}"
p "should be 300 #{highest_prod_of_three([-10, -5, 6])}"
p "should be 1200 #{highest_prod_of_three([-10, -5, 6, 10, 20])}"
