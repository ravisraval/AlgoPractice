# A crack team of love scientists from OkEros (a hot new dating site) have devised a way to represent dating profiles as rectangles on a two-dimensional plane.
# They need help writing an algorithm to find the intersection of two users' love rectangles. They suspect finding that intersection is the key to a matching algorithm so powerful it will cause an immediate acquisition by Google or Facebook or Obama or something.
#
# Two rectangles overlapping a little. It must be love.
# Write a function to find the rectangular intersection of two given love rectangles.
#
# As with the example above, love rectangles are always "straight" and never "diagonal." More rigorously: each side is parallel with either the x-axis or the y-axis.
#
# They are defined as hashes ↴ like this:
#
#   my_rectangle = {
#
#     # coordinates of bottom-left corner
#     ''left_x'' => 1,
#     ''bottom_y'' => 5,
#
#     # 'width' and 'height'
#     ''width'' => 10,
#     ''height'' => 4,
#
# }
#
# Your output rectangle should use this format as well.


def rect_intersection(rect1, rect2)
  rect1['right_x'] = rect1['left_x'] + rect1['width']
  rect1['top_y'] = rect1['bottom_y'] + rect1['height']

  rect2['right_x'] = rect2['left_x'] + rect2['width']
  rect2['top_y'] = rect2['bottom_y'] + rect2['height']


  intersect_rect = {}

  #rect1 further left and they overlap or at least touch
  if rect1['left_x'] <= rect2['left_x'] && rect1['right_x'] >= rect2['left_x']
    intersect_rect['left_x'] = rect2['left_x']
    intersect_rect['right_x'] = [rect2['right_x'], rect1['right_x']].min
  #rect2 further left
  elsif rect2['left_x'] <= rect1['left_x'] && rect2['right_x'] >= rect1['left_x']
    intersect_rect['left_x'] = rect1['left_x']
    intersect_rect['right_x'] = [rect1['right_x'], rect2['right_x']].min
  else
    return 'no intersection fam'
  end

  if rect1['bottom_y'] <= rect2['bottom_y'] && rect1['top_y'] >= rect2['bottom_y']
    intersect_rect['bottom_y'] = rect2['bottom_y']
    intersect_rect['top_y'] = [rect2['top_y'], rect1['top_y']].min
  elsif rect2['bottom_y'] <= rect1['bottom_y'] && rect2['top_y'] >= rect1['bottom_y']
    intersect_rect['bottom_y'] = rect1['bottom_y']
    intersect_rect['top_y'] = [rect1['top_y'], rect2['top_y']].min
  else
    return 'no intersection fam'
  end

  intersect_rect['width'] = intersect_rect['right_x'] - intersect_rect['left_x']
  intersect_rect['height'] = intersect_rect['top_y'] - intersect_rect['bottom_y']

  intersect_rect

end

my_rectangle = {
  'left_x' => 5,
  'bottom_y' => 5,
  'width' => 9,
  'height' => 8,
}

my_rectangle2 = {
  'left_x' => 3,
  'bottom_y' => 7,
  'width' => 8,
  'height' => 4
}

p rect_intersection(my_rectangle, my_rectangle2)
