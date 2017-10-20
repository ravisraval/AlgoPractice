# Find the contiguous subarray within an array (containing at least one number) which has the largest product.
#
# For example, given the array [2,3,-2,4],
# the contiguous subarray [2,3] has the largest product = 6.

def max_product(nums)
  pos_hash = Hash.new {|h,k| h[k] = []}

      nums.each_with_index do |num, idx|
          pos_hash.each do |old_num, old_val|
              old_val.push(old_val.last * num)
          end
          pos_hash[idx].push(num)
      end

      pos_hash.values.flatten.max

end

def max_product2(nums)
  product, lsubproduct, rsubproduct = [nums[0], nums[-1]].max, nums[0], nums[-1]

  (1...nums.size).each do |idx|
    lsubproduct  = 1 if lsubproduct == 0
    lsubproduct *= nums[idx]
    product = lsubproduct if product < lsubproduct

    rsubproduct  = 1 if rsubproduct == 0
    rsubproduct *= nums[-1 + -idx]
    product = rsubproduct if product < rsubproduct
  end

  product
end

def max_product3(nums)
  highest_seen = nums[0]
lowest_seen = nums[0]
highest_curr = nums[0]
lowest_curr = nums[0]

  nums[1..-1].each do |num|
      temp = highest_curr
      highest_curr = [highest_curr * num, num, lowest_curr * num].max
      lowest_curr = [temp * num, num, lowest_curr * num].min

      lowest_seen = [lowest_curr, lowest_seen].min
      highest_seen = [highest_curr, highest_seen].max
  end
  highest_seen
end

p max_product2([0.2,3,-2,4,-10,0.5,-2,-3])

#for funsees: maximum sum subarray

def maximum_sum_subarray(nums)
  highest_seen = nums[0]
  lowest_seen = nums[0]
  highest_curr = nums[0]
  lowest_curr = nums[0]

  nums[1..-1].each do |num|
    temp = highest_curr
    highest_curr = [num, highest_curr + num, lowest_curr + num].max
    lowest_curr = [num, temp + num, lowest_curr + num].min

    highest_seen = [highest_seen, highest_curr].max
    lowest_seen = [lowest_seen, lowest_curr].max
  end
  highest_seen
end

p maximum_sum_subarray([1,2,3,4,5,-80,5,4,15])
