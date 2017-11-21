# Complete the function below.

def doesCircleExist(commands)
  commands.map do |command|
    x_pos = 0
    y_pos = 0

    directions = {
      'U' => [0, 1],
      'L' => [-1, 0],
      'D' => [0, -1],
      'R' => [1, 0]
      }
    curr_dir = 0
    4.times do |time|
      command.split("").each do |move|
        if move == 'L'
          curr_dir += 1
          if curr_dir == 4
            curr_dir = 0
          end
        elsif move == 'R'
          curr_dir -= 1
          if curr_dir == -1
            curr_dir = 3
          end
        elsif move == 'G'
          x_pos += directions[directions.keys[curr_dir]][0]
          y_pos += directions[directions.keys[curr_dir]][1]
        end
      end
    end
    if x_pos == 0 && y_pos == 0
      'YES'
    else
      'NO'
    end

  end

end



# Enter your code here. Read input from STDIN. Print output to STDOUT
letters = ('a'..'z').to_a
arr = []
n = gets.to_i * 2
(0...n).each do |i|
    lis = gets.strip
    arr.push(lis) unless lis.scan(/\D/).empty?
end
y = arr.map do |word|
  count = Hash.new(0)
  new_word = word.split("").map do |ch|
    ch_idx = letters.index(ch)
    ch_idx += count[ch]
    ch_idx = ch_idx % 26
    count[ch] += 1
    letters[ch_idx]
  end.join("")
end

puts y
