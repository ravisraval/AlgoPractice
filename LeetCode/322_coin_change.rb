# AKA MIN_COINS

# You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
#
# Example 1:
# coins = [1, 2, 5], amount = 11
# return 3 (11 = 5 + 5 + 1)
#
# Example 2:
# coins = [2], amount = 3
# return -1.
#
# Note:
# You may assume that you have an infinite number of each kind of coin.
#

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
# def coin_change(coins, amount)
#   coins.sort!
#   amts = Array.new(amount + 1, Float::INFINITY)
#   amts[0] = 0
#   1.upto(amount).each do |curr_amt|
#     coins.each do |coin|
#       break if coin > curr_amt
#       amts[curr_amt] = [1 + amts[curr_amt - coin], amts[curr_amt]].min
#     end
#   end
#   amts.last == Float::INFINITY ? -1 : amts.last
# end
#
# p coin_change([1,2,5,10], 8)
a = Time.now
def min_coins(coins, amt)
  coins.sort!
  return -1 if amt < coins.first
  amts = Array.new(amt + 1, Float::INFINITY)
  amts[0] = 0

  coins.each do |coin|
    (coin..amt).each do |curr_amt|
      # break if coin > curr_amt
      amts[curr_amt] = [amts[curr_amt], amts[curr_amt - coin] + 1].min
    end
  end
  amts.last == Float::INFINITY ? -1 : amts.last
end

10000.times { min_coins([4,7], 180) }
puts Time.now - a

a = Time.now

def min_coins2(coins, amt)
  coins.sort!
  return -1 if amt < coins.first
  amts = Array.new(amt + 1, Float::INFINITY)
  amts[0] = 0

  (1..amt).each do |curr_amt|
    coins.each do |coin|
      break if coin > curr_amt
      amts[curr_amt] = [amts[curr_amt], amts[curr_amt - coin] + 1].min
    end
  end
  amts.last == Float::INFINITY ? -1 : amts.last
end

10000.times { min_coins2([4,7], 180) }
puts Time.now - a
