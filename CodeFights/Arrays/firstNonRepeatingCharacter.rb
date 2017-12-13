def firstNotRepeatingCharacter(s)
    s.chars.uniq.each do |ch|
        return ch if s.count(ch) == 1
    end
    '_'
end
