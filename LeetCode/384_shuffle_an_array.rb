# Shuffle a set of numbers without duplicates.
#
# Example:
#
# // Init an array with set 1, 2, and 3.
# int[] nums = {1,2,3};
# Solution solution = new Solution(nums);
#
# // Shuffle the array [1,2,3] and return its result. Any permutation of [1,2,3] must equally likely to be returned.
# solution.shuffle();
#
# // Resets the array back to its original configuration [1,2,3].
# solution.reset();
#
# // Returns the random shuffling of array [1,2,3].
# solution.shuffle();

class Solution

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
        @store = nums
    end


=begin
    Resets the array to its original configuration and return it.
    :rtype: Integer[]
=end
    def reset()
        @store
    end


=begin
    Returns a random shuffling of the array.
    :rtype: Integer[]
=end
    def shuffle()
        copy = @store.dup
        shuffled = []
        until copy.empty?
            rand_idx = rand(copy.length)
            shuffled.push(copy[rand_idx])
            copy.delete_at(rand_idx)
        end
        shuffled
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(nums)
# param_1 = obj.reset()
# param_2 = obj.shuffle()
