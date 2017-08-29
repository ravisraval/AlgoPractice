# Your quirky boss collects rare, old coins...
# They found out you're a programmer and asked you to solve something they've been wondering for a long time.
#
# Write a function that, given:
#
# an amount of money
# an array of coin denominations
# computes the number of ways to make the amount of money with coins of the available denominations.
#
# Example: for amount=4 (4¢) and denominations=[1,2,3], your program would output 4—the number of ways to make 4¢ with those denominations:
#
# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢
def change_possibilities_bottom_up(amount, denominations)
  ways_of_doing_n_cents = [0] * (amount + 1)
  ways_of_doing_n_cents[0] = 1

  denominations.each do |coin|
      (coin..amount).each do |higher_amount|
          higher_amount_remainder = higher_amount - coin
          ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
      end
  end

  return ways_of_doing_n_cents[amount]
end


p change_possibilities_bottom_up(4, [1,2,3])
