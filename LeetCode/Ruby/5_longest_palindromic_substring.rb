# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
#
# Example:
#
# Input: "babad"
#
# Output: "bab"
#
# Note: "aba" is also a valid answer.
# Example:
#
# Input: "cbbd"
#
# Output: "bb"

def longest_palindrome(s)
  buffer = 0
  until buffer == s.length

    0.upto(buffer).each do |buff|
      if is_palindrome?(s[buff..(-1 - (buffer - buff))])
        return s[buff..(-1 - (buffer - buff))]
      end
    end

    buffer += 1
  end

end

def is_palindrome?(s)
  s == s.reverse
end

#thoughts
#check just three at a time. if palindrome, try to build upon it

def better_longest_palindrome(s)

  longest = ''

  s[0..-2].chars.each_index do |idx|
    start_idx = idx
    end_idx = idx + 1
    worked = false

    while is_palindrome?(s[start_idx..end_idx])
      worked = true
      break if start_idx - 1 == -1 || end_idx + 1 == s.length
      break unless is_palindrome?(s[start_idx -1..end_idx + 1])
      start_idx -= 1
      end_idx += 1
    end

    if worked && end_idx - start_idx + 1 > longest.length
      longest = s[start_idx..end_idx]
    end

  end

  s[0..-3].chars.each_index do |idx|
    start_idx = idx
    end_idx = idx + 2
    worked = false

    while is_palindrome?(s[start_idx..end_idx])
      worked = true
      break if start_idx - 1 == -1 || end_idx + 1 == s.length
      break unless is_palindrome?(s[start_idx -1..end_idx + 1])
      start_idx -= 1
      end_idx += 1
    end

    if worked && end_idx - start_idx + 1 > longest.length
      longest = s[start_idx..end_idx]
    end

  end

  longest = s[0] if longest == "" && s.length != 0
  longest
end

#above is much better, but still could be improved by starting from the
#middle of the string, instead of the beginning


p better_longest_palindrome("Iloveracecars")
p better_longest_palindrome("Ilovers")
