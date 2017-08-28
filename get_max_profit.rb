def get_max(arg)
  # write the body of your function here
  current_low = nil
  current_max = nil

  arg.each_with_index do |price, idx|
    if current_low
      if current_max.nil? || price - current_low > current_max
        current_max = price - current_low
      end
    end

    if current_low.nil? || price < current_low
      current_low = price
    end
  end
  current_max
end

def brute_max(arr)
  current_max = nil

  arr.each_with_index do |price, idx|
    arr[idx + 1..-1].each do |price2|
      if current_max.nil? || price2 - price > current_max
        current_max = price2 - price
      end
    end
  end
  current_max
end

# run your function through some test cases here
# remember: debugging is half the battle!


puts get_max([10, 7, 1])
# puts my_function('test input')
