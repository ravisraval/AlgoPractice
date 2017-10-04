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


# optimal solution: use two pointers, starting from each end
# walk whichever pointer is smaller towards the middle

def optimal(heights)
  biggest_area_seen = 0

  pointer_1_idx = 0
  pointer_2_idx = heights.length - 1


  until pointer_1_idx == pointer_2_idx
    current_area =
    [ heights[pointer_1_idx], heights[pointer_2_idx]].min *
    (pointer_2_idx - pointer_1_idx)

    biggest_area_seen = current_area if current_area > biggest_area_seen

    if heights[pointer_1_idx] < heights[pointer_2_idx]
      pointer_1_idx += 1
    else
      pointer_2_idx -= 1
    end
  end

  biggest_area_seen

end
