def tri(n)
  n.times do |n|
    res = 0
    1.upto(n).each do |num|
      res += num
    end
    p res
  end
end

p tri(45) 
