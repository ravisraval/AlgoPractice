def isCryptSolution(crypt, solution)
    hsh = {}
    solution.each do |piece|
        hsh[piece[0]] = piece[1]
    end

    first = get_value(crypt[0], hsh)
    second = get_value(crypt[1], hsh)
    answer = get_value(crypt[2], hsh)

    return false if first[0] == '0' unless first.to_i == 0 && first.length == 1
    return false if second[0] == '0' unless second.to_i == 0  && second.length == 1
    return false if answer[0] == '0' unless answer.to_i == 0 && answer.length == 1

    first.to_i + second.to_i == answer.to_i

end

def get_value(str, hsh)
    res = ''
    str.each_char do |ch|
        res += hsh[ch]
    end
    res
end
    
