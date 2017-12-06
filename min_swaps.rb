# def say_hello
#   puts 'Hello, World'
# end

# 5.times { say_hello }



# Given a N * N matrix consisting of 0s and 1s. The number of 1s is k*k and k < N. Given that the only operation you can perform is swap (i1, j1) with (i2, j2) - find the minimum number of swaps needed to move all the 1s to a k*k square

#iterate through matrix through matrix[n-k][n-k], counting 1s
#when we found a 1, search a k*k square around that 1, counting 1s
#keep track of densest cluster
#subtract densest cluster from k*k


def min_swaps(matrix, k)
  max_density = 0
  matrix.each_with_index do |row, rowidx|
    row.each_with_index do |cell, colidx|
      next if matrix[rowidx + k - 1].nil?
      next if row[colidx + k - 1].nil?

      current_density = find_density(matrix, rowidx, colidx, k)
      max_density = current_density if current_density > max_density
    end
  end

  k * k - max_density
end

def find_density(matrix, rowidx, colidx, k)
  count = 0

  rowidx.upto(rowidx + k - 1).each do |curr_rowidx|
    colidx.upto(colidx + k - 1).each do |curr_colidx|
      count += 1 if matrix[curr_rowidx][curr_colidx] == 1
    end
  end

  count
end

test_matrix1 = [
  [0, 1, 0, 1, 0],
  [0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0]]

test_matrix2 = [
  [1, 1, 0, 1, 0],
  [0, 1, 0, 0, 1],
  [1, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0,1]]

test_matrix3 = [
  [0, 0, 1, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 1, 0, 1, 0]]
p min_swaps(test_matrix3, 2)
