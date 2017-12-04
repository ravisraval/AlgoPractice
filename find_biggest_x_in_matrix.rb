# INPUT: 2d array of 0s and 1s.
# OUTPUT: Size of largest X (defined as crossing diagonals of 1s)

#clarifying questions I would normally ask,
  #and then assumptions of those questions:

#how do you define crossing? ie.

# x       x             x         x
#   x   x                 x     x
#     x           vs        x x
#   x   x                   x x
# x       x               x     x
#                       x         x

# ^ assuming the left is correct

#what inputs can we expect?
  # assuming always 2d array
  # assuming that we could get an empty array
  # matrix L and W can be different, not just a square
  # always 0s or 1s

#does the X have to have diagonals of equal length? ie can it be lopsided
  #assuming diagonals' length is equal

#assuming output will be an integer that represents the length of one diagonal
  #if we were accepting a lopsided X, then '2x3' would make more sense


test_1 = [[0, 1, 0, 1, 0, 1],
          [0, 1, 0, 1, 0, 1],
          [0, 1, 0, 1, 0, 1],
          [0, 1, 0, 1, 0, 1],
          [1, 1, 1, 1, 0, 1],
          [0, 1, 0, 1, 0, 1],
        ]

test_2 = [[1, 1, 1, 1, 0, 1],
          [0, 1, 1, 1, 0, 1],
          [1, 1, 1, 1, 0, 1],
          [0, 1, 0, 1, 0, 1],
          [1, 1, 1, 1, 1, 1],
          [0, 1, 0, 1, 0, 1],
        ]

test_3 = [[]]

#initial thoughts:
  # an X's bounds are identical to a rectangle's corners.
  # We could search for rectange bounds first,
  # and then check if their diagonals are filled in with 1s,
  # starting from the biggest rectangle for efficiency

  # Another way: explode out from the middle, as opposed to
    # starting at [0][0]; a largest possible X would cross near the middle

  # Another way: Start with the largest possible X dimension
    # checking for 1s, and if true check rest of diagonals
    # keep going smaller until an X is found

  # Exploding 1s way: <-- way better than that ^^ tried to get fancy,
  # but maybe the 'simplest' way is actually best
  # need to remember to draw stuff out first
    # Iterate until a 1 is found. Branch out from it, checking for 1s.
    # Xs are only made of odd lengths, min 3
    # Only ever need to check down right from a 1!!
    #



# pseudocode
  # 1) Iterate until a 1

  # 2) check down right, see how long 1s chain goes

  # 3) start with largest odd 1s chain: take middle of chain,
      # check to see if other diagonal is present

  # 4) if an X is made, update longest as needed

  # 5) else, if present, check other odd lengths of this same 1s chain
      # ie, 5 1s, 5 didn't work, check first and last 3

  # 6) if all goes well with step 5 and we're able to check all odd
      # iterations, we should be able to skip those 1s next time
      # add those coords to a 'visited' array.

      # NOTE:This would help time complexity but hurt space complexity
      # If time complexity isn't at all important and space complexity is,
      # then I suppose one modify step 5 to only check first 5 1s,
      # then first 3 1s, etc., just not middle or last 1s. Thus,
      # you wouldn't keep track of visited 1s. Unlikely?

  # 7) continue iteration through third to last row (an X couldn't be
        # contained only in last two rows)

def find_biggest_x(matrix)

  longest_x = 0
  # visited_coords = []

  matrix.each_index do |row_idx|
    matrix[row_idx].each_with_index do |num, col_idx|

      # if num == 1 && !visited_coords.include?([row_idx, col_idx])
      if num == 1
        #check_for_x returns:
          # length of 1s chain
          # longest cross found  and its starting_coords
        # chain_length, longest_current_x,starting_coords = check_for_x(row_idx, col_idx, matrix)

        longest_current_x = check_for_x(row_idx, col_idx, matrix)

        longest_x = longest_current_x if longest_current_x > longest_x

      end

    end
  end

  longest_x

end

def check_for_x(row_idx, col_idx, matrix)
  #first, determine length of down-right diagonal
  chain_length = 1
  row_idx_counter = row_idx
  col_idx_counter = col_idx

  while matrix[row_idx_counter + 1][col_idx_counter + 1] == 1
    chain_length += 1
    row_idx_counter += 1
    col_idx_counter += 1
  end

  # if the 1s chain isn't long enough, we're done with this iteration
  if chain_length < 3
    return [chain_length, 0, [row_idx, col_idx]]
  end

  useable_length = chain_length.odd? chain_length : chain_length - 1


  while useable_length >= 3

    #check other diag

    useable_length -= 2
  end



end











def find_x(matrix)
  biggest_seen = 0
  visited = []
  matrix.each_with_index do |row, rowidx|
    row.each_with_index do |cell, colidx|
      next if cell == 0 || visited.include?([rowidx, colidx])
      current_length = determine_length(matrix, rowidx, colidx)
      biggest_seen = current_length if current_length > biggest_seen
    end
  end
  biggest_seen
end

def determine_length(matrix, rowidx, colidx)
  #first, find how far down-right this goes
  right_length = 1

  while matrix[rowidx + 1] && matrix[rowidx + 1][colidx + 1] == 1
    right_length += 1
  end





end
