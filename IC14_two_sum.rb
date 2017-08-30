# You've built an inflight entertainment system with on-demand movie streaming.
# Users on longer flights like to start a second movie right when their first one ends, but they complain that the plane usually lands before they can see the ending. So you're building a feature for choosing two movies whose total runtimes will equal the exact flight length.
#
# Write a function that takes an integer flight_length (in minutes) and an array of integers movie_lengths (in minutes) and returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length.
#
# When building your function:
#
# Assume your users will watch exactly two movies
# Don't make your users watch the same movie twice
# Optimize for runtime over memory

def two_sum_present?(flight_length, movie_lengths)
  movie_length_hash = Hash.new(0)

  movie_lengths.each do |movie_length|
    return true if movie_length_hash.has_key?(flight_length - movie_length)
    movie_length_hash[movie_length] += 1
  end

  false
end

puts "should be false : #{two_sum_present?(10, [3,4,5])}"
puts "should be true : #{two_sum_present?(10, [5,5])}"
