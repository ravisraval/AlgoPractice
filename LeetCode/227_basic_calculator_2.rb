# Implement a basic calculator to evaluate a simple expression string.
#
# The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.
#
# You may assume that the given expression is always valid.
#
# Some examples:
# "3+2*2" = 7
# " 3/2 " = 1
# " 3+5 / 2 " = 5
# Note: Do not use the eval built-in library function.

# @param {String} s
# @return {Integer}
def calculate(s)
  s.delete!(' ')
  # deal with * and /
  idx = 0
  while idx < s.length
    if s[idx] == '*' || s[idx] == '/'
      # get bounds
      ldx = idx
      rdx = idx
      ldx -= 1 while ldx > 0 && !'+-*/'.include?(s[ldx - 1])
      ldx -= 1 if ldx == 1 && s[0] == '-'
      rdx += 1 while rdx < s.length - 1 && !'+-*/'.include?(s[rdx + 1])

      # eval
      product =
        if s[idx] == '*'
          (s[ldx...idx].to_i * s[idx + 1..rdx].to_i).to_s
        else
          (s[ldx...idx].to_i / s[idx + 1..rdx].to_i).to_s
        end

      s[ldx..rdx] = product
      idx = ldx + product.length - 1
    end

    idx += 1
  end

  idx = 0
  while idx < s.length
    if s[idx] == '+' || s[idx] == '-'
      ldx = idx
      rdx = idx
      ldx -= 1 while ldx > 0 && !'+-*/'.include?(s[ldx - 1])
      ldx -= 1 if ldx == 1 && s[0] == '-'
      rdx += 1 while rdx < s.length - 1 && !'+-*/'.include?(s[rdx + 1])

      product =
        if s[idx] == '+'
          (s[ldx...idx].to_i + s[idx + 1..rdx].to_i).to_s
        else
          (s[ldx...idx].to_i - s[idx + 1..rdx].to_i).to_s
        end

      s[ldx..rdx] = product
      idx = ldx + product.length - 1
    end

    idx += 1
  end

  s.to_i
end
