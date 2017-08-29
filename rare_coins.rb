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
class Change

  def initialize
    @memo = { }
  end


  def rare_coins(amount_left, coins, idx = 0)

    memo_key = [amount_left, idx].to_s
    if @memo.include?(memo_key)
      return @memo[memo_key]
    end

    return 1 if amount_left == 0

    return 0 if amount_left < 0

    return 0 if idx == coins.length

    current_coin = coins[idx]

    num_possibilities = 0

    while amount_left >= 0
      num_possibilities += rare_coins(amount_left, coins, idx + 1)
      amount_left -= current_coin
    end

    @memo[memo_key] = num_possibilities

    num_possibilities

  end
end


p rare_coins(4, [1,2,3])
