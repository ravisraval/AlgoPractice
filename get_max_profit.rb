def my_function(arg)
    # write the body of your function here
    current_high_idx = nil
    current_low_idx = nil
    current_max = nil

    arg.each_with_index do |price, idx|
        if price > arg[current_high_idx] || current_high_idx == nil
            current_high_idx = idx
        end
        if price < arg[current_low_idx] || current_low_idx == nil
            current_low_idx = idx
        end
    end
    arg[current_high_idx] - arg[current_low_idx]
    return "running with #{arg}"
end

# run your function through some test cases here
# remember: debugging is half the battle!
puts my_function('test input')
