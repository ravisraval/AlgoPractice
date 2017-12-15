def bestFriendNames(name1, name2)
    letters = ('a'..'z').to_a
    value1 = 0
    value2 = 0

    name1.chars.each do |ch|
        next if ch == " "
        value1 += letters.index(ch.downcase) + 1
    end
    name2.chars.each do |ch|
        next if ch == " "
        value2 += letters.index(ch.downcase) + 1
    end
    value1 == value2
end
