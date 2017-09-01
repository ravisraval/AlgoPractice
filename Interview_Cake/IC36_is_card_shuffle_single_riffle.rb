# I figured out how to get rich: online poker.
# I suspect the online poker game I'm playing shuffles cards by doing a single riffle. ↴
#
# To prove this, let's write a function to tell us if a full deck of cards shuffled_deck is a single riffle of two other halves half1 and half2.
#
# We'll represent a stack of cards as an array of integers in the range 1..521..52 (since there are 5252 distinct cards in a deck).
#
# Why do I care? A single riffle is not a completely random shuffle. If I'm right, I can make more informed bets and get rich and finally prove to my ex that I am not a "loser with an unhealthy cake obsession" (even though it's too late now because she let me go and she's never getting me back).


def is_single_riffle?(shuffled_deck, half1, half2)
  half1_index = 0
  half2_index = 0

  shuffled_deck.each do |card|
    if card == half1[half1_index]
      half1_index += 1
    elsif card == half2[half2_index]
      half2_index += 1
    else
      return false
    end
  end
  true
end


half1 = [1,4,7,8]
half2 = [3,5,6,9]

shuffled_deck = [1,4,3,5,6,7,8,9]

p is_single_riffle?(shuffled_deck, half1, half2)
