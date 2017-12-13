def containsCloseNums(nums, k)
    nums_hsh = Hash.new{|h,k| h[k] = []}

    nums.each_with_index do |num, idx|
        unless nums_hsh[num].empty?
            return true if (idx - nums_hsh[num].last) <= k
        end
        nums_hsh[num].push(idx)
    end
    false
end
