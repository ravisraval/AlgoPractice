# Write a program to find the n-th ugly number.
#
# Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. For example, 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
#
# Note that 1 is typically treated as an ugly number, and n does not exceed 1690.


# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  count = 0
  num_to_check = 1
  until count == n
    if is_ugly?(num_to_check)
      uglies.push(num_to_check)
      last_ugly = num_to_check
      count += 1
    end
    num_to_check += 1
  end
  last_ugly
end

def is_ugly?(num)
  return true if num == 1 || num == 2 || num == 3 || num == 5
  num /= 5 while num % 5 == 0
  num /= 2 while num % 2 == 0
  num /= 3 while num % 3 == 0
  return false unless num == 1
  true

end
