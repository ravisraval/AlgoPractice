#memo fib

def memo_fib(n, memo = [0, 1])

  return memo[n] if memo[n]

  memo[n] = memo_fib(n - 1, memo) + memo_fib(n - 2, memo)

  return memo[n]
end


def iter_fib(n)

  memo = [0,1]
  until memo.length == n + 1
    memo.push(memo[-1] + memo[-2])
  end
  memo.last
end

# p memo_fib(1000)
# p iter_fib(1000)

$iter_fib = Proc.new do |n|
  memo = [0,1]
  until memo.length == n + 1
    memo.push(memo[-1] + memo[-2])
  end
  memo.last
end

$dp_fib = Proc.new do |n, memo = [0,1]|
  return memo[n] if memo[n]

  memo[n] = memo_fib(n - 1, memo) + memo_fib(n - 2, memo)

  memo[n]
end

def benchmark(times_to_run, prc)

  a = Time.now

  times_to_run.times do |time|
    prc.call(100)
  end

  Time.now - a
end


# p benchmark(100000, $iter_fib)
# p benchmark(100000, $dp_fib)




#problem 2: count paths from top left of matrix to bottom right, with some spaces blocked off

#crappy recursive solution

def countPaths(matrix, row, col)
  if !validSquare(matrix, row, col)
    return 0;
  end

  if isAtEnd(matrix, row, col)
    return 1;
  end

  return countPaths(matrix, row + 1, col) + countPaths(matrix, row, col + 1)
end

def validSquare(matrix, row, col)
  if matrix[row] && matrix[row][col] && matrix[row][col] == 'unblocked'
    return true
  else
    return false
  end
end

def isAtEnd(matrix, row, col)
  row == matrix.length - 1 && col == matrix[row].length - 1
end


matrix2 = Array.new(15) {Array.new(15, 'unblocked')}
matrix2[1][1] = 'blocked'
matrix2[2][3] = 'blocked'
matrix2[3][1] = 'blocked'
matrix2[4][1] = 'blocked'

# p countPaths(matrix, 0, 0)


def countPaths(matrix)

  memo_grid = matrix
  memo_grid.each_index do |rowidx|
    memo_grid[rowidx].each_index do |colidx|
      if memo_grid[rowidx][colidx] == 'blocked'
        memo_grid[rowidx][colidx] = 0
      else
        memo_grid[rowidx][colidx] = 1
      end
    end
  end

  #deal with 0s on bottom row
  saw_zero = false
  (memo_grid.last.length - 1).downto(0).each do |colidx|
    if saw_zero
      memo_grid.last[colidx] = 0
    else
      if memo_grid.last[colidx] == 0
        saw_zero = true
      end
    end
  end

  #deal with 0s on right col
  saw_zero = false
  (memo_grid.length - 1).downto(0).each do |rowidx|
    if saw_zero
      memo_grid[rowidx].last = 0
    else
      if memo_grid[rowidx].last == 0
        saw_zero = true
      end
    end
  end

  (memo_grid.length - 2).downto(0).each do |rowidx|
    (memo_grid[rowidx].length - 2).downto(0).each do |colidx|
      next if memo_grid[rowidx][colidx] == 0

      memo_grid[rowidx][colidx] = memo_grid[rowidx + 1][colidx] + memo_grid[rowidx][colidx + 1]
      system("clear")
      print_grid(memo_grid)
      sleep(0.1)
    end
  end
  memo_grid[0][0]
end

def print_grid(grid)

  grid.each do |row|
    p row
  end
end

p countPaths(matrix2)
