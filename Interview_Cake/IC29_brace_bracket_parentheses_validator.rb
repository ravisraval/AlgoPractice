#To improve DRY, use a hash:
# { '[' => ']'... etc}

def good_stuff?(str)
  bracket_array = []

  str.each_char do |ch|

    if ch == ']' || ch == '}' || ch == ')'
      return false if bracket_array.empty?
    end

    if ch == ']'
      if bracket_array.last == '['
        bracket_array.pop
      else
        return false
      end
    end

    if ch == '}'
      if bracket_array.last == '{'
        bracket_array.pop
      else
        return false
      end
    end

    if ch == ')'
      if bracket_array.last == '('
        bracket_array.pop
      else
        return false
      end
    end

    if ch == '[' || ch == '{' || ch == '('
      bracket_array.push(ch)
    end

  end
  true

end

p good_stuff?("{ [ ] ( ) }")
p good_stuff?("{ [ ( ] ) }")
p good_stuff?("{ [ }")
