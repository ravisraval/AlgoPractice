# Find a duplicate, Space Edition™.
# We have an array of integers, where:
#
# The integers are in the range 1..n1..n
# The array has a length of n+1n+1
# It follows that our array has at least one integer which appears at least twice. But it may have several duplicates, and each duplicate may appear more than twice.
#
# Write a function which finds an integer that appears more than once in our array. (If there are multiple duplicates, you only need to find one of them.)
#
# We're going to run this function on our new, super-hip Macbook Pro With Retina Display™. Thing is, the damn thing came with the RAM soldered right to the motherboard, so we can't upgrade our RAM. So we need to optimize for space!
# require 'byebug'
def find_repeat(the_array)
    floor = 1
    ceiling = the_array.length - 1

    while floor < ceiling

        # divide our range 1..n into an upper range and lower range
        # (such that they don't overlap)
        # lower range is floor..midpoint
        # upper range is midpoint+1..ceiling
        midpoint = floor + ((ceiling - floor) / 2)
        lower_range_floor, lower_range_ceiling = floor, midpoint
        upper_range_floor, upper_range_ceiling = midpoint+1, ceiling

        # count number of items in lower range
        items_in_lower_range = 0
        the_array.each do |item|
            # is it in the lower range?
            if item >= lower_range_floor and item <= lower_range_ceiling
                items_in_lower_range += 1
            end
        end

        distinct_possible_integers_in_lower_range = \
            lower_range_ceiling - lower_range_floor + 1

        if items_in_lower_range > distinct_possible_integers_in_lower_range
            # there must be a duplicate in the lower range
            # so use the same approach iteratively on that range
            floor, ceiling = lower_range_floor, lower_range_ceiling
        else
            # there must be a duplicate in the upper range
            # so use the same approach iteratively on that range
            floor, ceiling = upper_range_floor, upper_range_ceiling
        end
    end

    # floor and ceiling have converged
    # we found a number that repeats!
    return floor
end


p find_repeat([1,2,3,3])
p find_repeat([1,2,3,4])
p find_repeat([2,1,5,2])
