# Write an efficient function that checks whether any permutation ↴ of an input string is a palindrome. ↴
# You can assume the input string only contains lowercase letters.
#
# Examples:
#
# "civic" should return true
# "ivicc" should return true
# "civil" should return false
# "livci" should return false
# "But 'ivicc' isn't a palindrome!"
# If you had this thought, read the question again carefully. We're asking if any permutation of the string is a palindrome. Spend some extra time ensuring you fully understand the question before starting. Jumping in with a flawed understanding of the problem doesn't look good in an interview.
def has_palindrome_permutation?(str)

  letter_hash = {}
  str.each_char do |ch|

    if letter_hash[ch] == 1
      letter_hash.delete(ch)
    else
      letter_hash[ch] = 1
    end

  end

    return true if letter_hash.keys.length == 0 || letter_hash.keys.length == 1

    false
end

  p has_palindrome_permutation?('civic')
  p has_palindrome_permutation?('ivicc')
  p has_palindrome_permutation?('civil')
  p has_palindrome_permutation?('livci')
  p has_palindrome_permutation?('raccar')
