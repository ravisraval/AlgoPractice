# Complete the function below.


def  wordpattern( pattern,  input)
  return 1 if pattern.length == 1

  sub_inputs = [input[0]]
  input[1..-1].each_char do |ch|
    new_sub_input = []
    sub_inputs.each do |old_str|
      new_sub_input.push(old_str + ch, old_str + ' ' + ch)
    end
    sub_inputs = new_sub_input
  end

  sub_inputs.select! { |sub| sub.count(' ') == pattern.length - 1}

  sub_inputs.each do |sub|
    works = true
    split_sub = sub.split(' ')
    pattern_map = {}
    pattern.chars.each_with_index do |ch, idx|
      if pattern_map.key?(ch)
        unless pattern_map[ch] == split_sub[idx]
          works = false
          break
        end
      else
        pattern_map[ch] = split_sub[idx]
      end
    end
    next unless pattern_map.values == pattern_map.values.uniq
    return 1 if works
  end

  0
end
