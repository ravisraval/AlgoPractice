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

#how to improve?
#DP? see biggest area that can be made with first two
#then for everyone additional line, check it against the biggest previous
#meh idk if that works

#keep track of location of highest numbers.

#wait.. you never want to save
def slightly_better(heights)
  saved = {}
  biggest_area = 0
  biggest_height_seen = 0
  i = 1

  heights.each do |height|
    #keep tracking of earliest instance of height
    #only save numbers higher than previously seen
    if height > biggest_height_seen
      biggest_height_seen = height
      saved[height] = i unless saved.has_key?(height)
    end


    #check against biggest
    #only need to check against earliest prev where old_height <= height
    saved.each do |old_height, old_x|
      current_area = [old_height, height].min * (i - old_x)
      biggest_area = current_area if current_area > biggest_area
    end

    i += 1
  end

biggest_area

end


# def optimal(heights)
#   saved = {}
#   biggest_num_seen = 0
#   i = 1
#   height_of_current_greatest_area = 0
#   greatest_area_seen = 0
#
#   heights.each do |height|
#     possible_new_area = 0
#     possible_new_height = 0
#
#     saved[height] = i unless saved.has_key?(height)
#
#     if height > biggest_num_seen
#       biggest_num_seen = height
#     end
#
#     #make our old greatest area bigger by one x
#     if height >= height_of_current_greatest_area
#       greatest_area_seen += height_of_current_greatest_area
#     end
#
#     #find max height that could be made with current line and some prev
#     height.downto(1).each do |possible_height|
#       if saved.has_key?(possible_height)
#         possible_new_area = possible_height * (i - saved[possible_height])
#         possible_new_height = possible_height
#         break
#       end
#     end
#
#     if possible_new_area > greatest_area_seen
#       greatest_area_seen = possible_new_area
#       height_of_current_greatest_area = possible_new_height
#     end
#
#     i += 1
#   end
#
#   greatest_area_seen
# end
