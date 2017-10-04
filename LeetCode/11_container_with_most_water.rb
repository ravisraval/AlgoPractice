# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
#
# Note: You may not slant the container and n is at least 2.

def brute(heights)
  saved = {}
  i = 1
  heights.each do |height|
    saved[i] = height
    i += 1
  end

  biggest = 0

  saved.each do |x, y|
    saved.each do |x2,y2|
      next unless x < x2
      current_area = (x2 - x) * [y2, y].min
      biggest = current_area if current_area > biggest
    end
  end

  biggest      
end
