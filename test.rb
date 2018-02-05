def length_of_lis(nums)
    tails = Array.new(nums.size){0}
    size = 0
    nums.each do |x|
        i=0
        j=size
        while i!=j do
            m = (i+j)/2
            if tails[m] < x
                i = m+1
            else
                j = m
            end
        end
        tails[i] = x
        size = [i+1, size].max
        p tails
        puts "current longest: #{size}"
        puts "current num: #{x}"
        puts
    end
    p size
end
length_of_lis([2,1,5,4,6,-3, -2, -1,0, 7])
