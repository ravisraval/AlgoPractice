# Given a digit string, return all possible letter combinations that the number could represent.
#
# A mapping of digit to letters (just like on the telephone buttons) is given below.
#
#
#
# Input:Digit string "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
# Note:
# Although the above answer is in lexicographical order, your answer could be in any order you want.


def letter_combinations(digits)

  DIGIT_HASH = {
    '2' => ['a', 'b', 'c'],
    '3' => ['d', 'e', 'f'],
    '4' => ['g', 'h', 'i'],
    '5' => ['j', 'k', 'l'],
    '6' => ['m', 'n', 'o'],
    '7' => ['p', 'q', 'r', 's'],
    '8' => ['t', 'u', 'v'],
    '9' => ['w', 'x', 'y', 'z']
  }

  res = []

  digits.each do |digit|
    
    if res.empty?
      res = DIGIT_HASH[digit]
    else
      temp_array = []
      res.each do |stored|
        DIGIT_HASH[digit].each do |new_letter|
          temp_array.push(stored + new_letter)
        end
      end
      res = temp_array
    end

  end

  res
end
