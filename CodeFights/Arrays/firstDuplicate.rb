def firstDuplicate(a)
    hsh = {}
    a.each do |i|
        return i if hsh.has_key?(i)
        hsh[i] = true
    end
    -1
end
