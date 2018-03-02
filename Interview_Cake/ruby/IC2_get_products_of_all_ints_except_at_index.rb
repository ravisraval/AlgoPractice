def get_prods(arr)
  res = []
  arr.each_index do |idx|
    res.push((arr[0...idx] + arr[idx + 1..-1]).reduce(:*))
  end
  res
end
p get_prods([1,7,3,4])
