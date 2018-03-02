# A building has 100 floors. One of the floors is the highest floor an egg can be dropped from without breaking.
# If an egg is dropped from above that floor, it will break. If it is dropped from that floor or below, it will be completely undamaged and you can drop the egg again.
#
# Given two eggs, find the highest floor an egg can be dropped from without breaking, with as few drops as possible.


def egg_broke?(secret_highest_floor, attempted_floor)
  attempted_floor > secret_highest_floor
end

def drop_second(secret_highest_floor, attempted_floor)

  while true

    unless egg_broke?(secret_highest_floor, attempted_floor)
      attempted_floor += 1
    else
      puts secret_highest_floor
      return attempted_floor - 1
    end

  end

end

def egg_drop
  secret_highest_floor = rand(1..100)
  current_floor = 14
  drops = 1
  floor_jump = 9

  while true

    if egg_broke?(secret_highest_floor, current_floor)
      drops += 1
      return drop_second(secret_highest_floor, current_floor - floor_jump - 1)
    end

    current_floor += floor_jump
    floor_jump -= 1
    drops += 1
  end

end


p egg_drop
