#
# Discuss Pick One
# There is a brick wall in front of you. The wall is rectangular and has several rows of bricks. The bricks have the same height but different width. You want to draw a vertical line from the top to the bottom and cross the least bricks.
#
# The brick wall is represented by a list of rows. Each row is a list of integers representing the width of each brick in this row from left to right.
#
# If your line go through the edge of a brick, then the brick is not considered as crossed. You need to find out how to draw the line to cross the least bricks and return the number of crossed bricks.
#
# You cannot draw a line just along one of the two vertical edges of the wall, in which case the line will obviously cross no bricks.
#
# Example:
# Input:
# [[1,2,2,1],
#  [3,1,2],
#  [1,3,2],
#  [2,4],
#  [3,1,2],
#  [1,3,1,1]]
# Output: 2
# Explanation:
#
# Note:
# The width sum of bricks in different rows are the same and won't exceed INT_MAX.
# The number of bricks in each row is in range [1,10,000]. The height of wall is in range [1,10,000]. Total number of bricks of the wall won't exceed 20,000.


#thoughts:
#width of wall is constant, so could find 'length' of one row, and
#then iterate from 1..length - 1, checking how many bricks each line crosses

#could iterate through each row, making a new array of the widths that
#dont pass through a brick. so [2,3,1,2] => [2,5,6]

def least_bricks(wall)
  width = wall[0].reduce(:+)

  #make new array with safe spots
  safe_widths = []
  wall.each do |row|
    current_total = 0
    current_safe_widths = []

    row.each do |brick|
      current_total += brick
      current_safe_widths.push(current_total)
    end

    safe_widths.push(current_safe_widths)
  end

  lowest_count = nil
  (1..width - 1).each do |vertical|
    current_count = 0
    safe_widths.each do |row|
      current_count += 1 unless row.include?(vertical)
    end

    if lowest_count.nil? || current_count < lowest_count
      lowest_count = current_count
    end
  end
  
  lowest_count
end
