require 'set'
def count(s)
  res = Set.new
  s.chars.each_with_index do |ch, idx|
    left_idx = idx
    right_idx = idx

    until left_idx == 0 && right_idx == s.length - 1
      substring = s[left_idx..right_idx]

      if substring == substring.reverse
        res << substring

        # check left
        unless left_idx == 0
          substring = s[left_idx - 1..right_idx]
          if substring == substring.reverse
            res << substring
          end
        end

        # check right
        unless right_idx == s.length - 1
          substring = s[left_idx..right_idx + 1]
          if substring == substring.reverse
            res << substring
          end
        end

        left_idx -= 1 unless left_idx == 0
        right_idx += 1 unless right_idx == s.length - 1

      else # wasn't a palindrome, so no need to keep checking
        left_idx -= 1 unless left_idx == 0
        right_idx += 1 unless right_idx == s.length - 1
        next
      end
    end
  end

  res << s if s == s.reverse
  res.length
end
