# Write a recursive function for generating all permutations of an input string. Return them as a set.
# Don't worry about time or space complexity—if we wanted efficiency we'd write an iterative version.
#
# To start, assume every character in the input string is unique.
#
# Your function can have loops—it just needs to also be recursive.

require 'set'

def recursive_perm_str(str)

  return [str] if str.length <= 1

  first = str.slice!(0)

  some_perms = recursive_perm_str(str)

  total_perms = Set.new

  some_perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << (perm[0...i] + first + perm[i..-1]).to_s
    end
  end
  total_perms
end

p recursive_perm_str('butt')
