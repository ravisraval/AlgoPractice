def sumOfTwo(a, b, v)
    hsh = {}
    a.each do |n|
        hsh[n] = true
    end
    b.each do |n|
        return true if hsh.has_key?(v - n)
    end
    false
end
