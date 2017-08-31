# I like parentheticals (a lot).
# "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
#
# Write a function that, given a sentence like the one above, along with the position of an opening parenthesis, finds the corresponding closing parenthesis.
#
# Example: if the example string above is input with the number 10 (position of the first parenthesis), the output should be 79 (position of the last parenthesis).

# def find_corresponding_parenthetical(str, first_idx)
#   paren_stack = [str[first_idx]]
#
#   str[first_idx + 1..-1].chars.each_with_index do |ch, idx|
#
#     if ch == ')'
#       paren_stack.pop
#       return idx + first_idx + 1 if paren_stack.empty?
#     elsif ch == '('
#       paren_stack.push('(')
#     end
#
#   end
#
# end

def find_corresponding_parenthetical(str, first_idx)
  paren_stack = 1

  str[first_idx + 1..-1].chars.each_with_index do |ch, idx|

    if ch == ')'
      paren_stack -= 1
      return idx + first_idx + 1 if paren_stack == 0
    elsif ch == '('
      paren_stack += 1
    end

  end

end

msg = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

p find_corresponding_parenthetical(msg, 10)
