# Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
#
# You may assume the integer do not contain any leading zero, except the number 0 itself.
#
# The digits are stored such that the most significant digit is at the head of the list.
#

299

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  reversed = digits.reverse
  carry = 1
  idx = 0

  reversed.each_with_index do |num, idx|
    break unless carry == 1

    if num == 9
      reversed[idx] = 0
    else
      reversed[idx] += 1
      carry = 0
    end
  end
  if carry == 1
    reversed.push(1)
  end
  reversed.reverse
end
