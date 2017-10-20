def max_sub_array(nums)

  hs = ls = hc = lc = nums[0]
  nums[1..-1].each do |num|
    tmp = hc
    hc = [num, hc + num, lc + num].max
    lc = [num, hc + num, lc + num].min
    hs = [hs, hc].max
    ls = [ls, lc].min
  end
  hs
end
