def missingNumber(arr)
    hsh = {}
    arr.each do |n|
        hsh[n] = true
    end
    0.upto(arr.length).each do |n|
        return n unless hsh.has_key?(n)
    end
end
