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
  cake_arrays.sort_by! {|weight, value| value.fdiv(weight)}.reverse!

  max_value = 0
  cake_arrays.each do |cake_weight, cake_value|
    times_current_cake_fits = capacity / cake_weight
    max_value += cake_value * times_current_cake_fits
    capacity -= cake_weight * times_current_cake_fits
  end
  max_value

end


cake_arrays = [[7, 160], [3, 90], [2, 15]]
capacity = 20
p max_duffel_bag_value(cake_arrays, capacity)
