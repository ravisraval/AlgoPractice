def findProfession(level, pos)
  levels = []
    curr_level = ['E']
    level_count = 1
    until level_count == level
      levels.push(curr_level)
        curr_level = build_levels(curr_level)
        level_count += 1
    end
    max_len = levels.last.length
    levels.each do |level|
      (max_len - level.length).times do |n|
        level.push('')
        level.unshift('')
      end
    end
    levels.map { |level| p level.join(" - ") }
    return 'Doctor' if curr_level[pos - 1] == 'D'
    'Engineer'
end

def build_levels(curr_level)
    new_level = []
    curr_level.each do |person|
        if person == 'E'
            new_level.push('E', 'D')
        else
            new_level.push('D', 'E')
        end
    end
    new_level
end

p findProfession(7, 2)
