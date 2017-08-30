# You are a renowned thief who has recently switched from stealing precious metals to stealing cakes because of the insane profit margins. You end up hitting the jackpot, breaking into the world's largest privately owned stock of cakes—the vault of the Queen of England.
# While Queen Elizabeth has a limited number of types of cake, she has an unlimited supply of each type.
#
# Each type of cake has a weight and a value, stored in an array with two indices:
#
# An integer representing the weight of the cake in kilograms
# An integer representing the monetary value of the cake in British pounds
# For example:
#
#   # weighs 7 kilograms and has a value of 160 pounds
# [7, 160]
#
# # weighs 3 kilograms and has a value of 90 pounds
# [3, 90]
#
# You brought a duffel bag that can hold limited weight, and you want to make off with the most valuable haul possible.
#
# Write a function max_duffel_bag_value() that takes an array of cake type arrays and a weight capacity, and returns the maximum monetary value the duffel bag can hold.
#
# For example:
#
#   cake_arrays = [[7, 160], [3, 90], [2, 15]]
# capacity = 20
#
# max_duffel_bag_value(cake_arrays, capacity)
# # returns 555 (6 of the middle type of cake and 1 of the last type of cake)
#
# Weights and values may be any non-negative integer. Yes, it's weird to think about cakes that weigh nothing or duffel bags that can't hold anything. But we're not just super mastermind criminals—we're also meticulous about keeping our algorithms flexible and comprehensive.

def max_duffel_bag_value(cake_arrays, capacity)

  cake_arrays.delete_if { |w, v| w == 0 && v == 0 }

  return 'No cakes to steal' if cake_arrays.empty?

  if cake_arrays.any? { |w, v| w == 0 }
    puts %Q(There's a magical weightless cake that's worth something, so...#{Float::INFINITY})

    exit
  end

  best_capacities = [0] * (capacity + 1)

  (0..capacity).each do |current_capacity|

    best_value_current_cap = 0

    cake_arrays.each do |cake_weight, cake_value|
      #only use cakes that are less than current_capacity
      if cake_weight <= current_capacity
        #always just use one cake
        remaining_capacity = current_capacity - cake_weight

        if best_capacities[remaining_capacity] + cake_value >
           best_value_current_cap

           best_value_current_cap =
           best_capacities[remaining_capacity] + cake_value
         end

       end

     end

     best_capacities[current_capacity] = best_value_current_cap
   end

  best_capacities.last
end


cake_arrays = [[7, 160], [3, 90], [2, 15]]
cake_arrays2 = [[0, 5], [3, 90], [2, 15]]
capacity = 20
capacity2 = 9
cake_arrays3 = [[3, 40], [5, 70]]
p max_duffel_bag_value(cake_arrays, capacity)
p max_duffel_bag_value(cake_arrays, 0)
p max_duffel_bag_value(cake_arrays3, capacity2)
p max_duffel_bag_value(cake_arrays2, capacity)
