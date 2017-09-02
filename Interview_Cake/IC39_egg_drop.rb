# A building has 100 floors. One of the floors is the highest floor an egg can be dropped from without breaking.
# If an egg is dropped from above that floor, it will break. If it is dropped from that floor or below, it will be completely undamaged and you can drop the egg again.
#
# Given two eggs, find the highest floor an egg can be dropped from without breaking, with as few drops as possible.


def egg_broke?(secret_highest_floor, attempted_floor)
  attempted_floor > secret_highest_floor
end

def egg_drop
  secret_highest_floor = rand(1..100)
  drops = 1

  current_floor = 3
  # puts "secret floor: #{secret_highest_floor}"
  while true

    if egg_broke?(secret_highest_floor, current_floor)
      drops += 1
      if egg_broke?(secret_highest_floor, current_floor - 1)
        puts "drops: #{drops}"
        return "highest_floor #{current_floor - 2}"
      else
        puts "drops: #{drops}"
        return "highest_floor: #{current_floor - 1}"
      end
    end

    current_floor += 2
    drops += 1
  end

end


p egg_drop
