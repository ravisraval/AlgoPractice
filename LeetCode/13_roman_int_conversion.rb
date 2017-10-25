# Given a roman numeral, convert it to an integer.
#
# Input is guaranteed to be within the range from 1 to 3999.

def roman_to_int(numeral)

  numerals = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  individual_numbers = []
  res = 0
  numeral.each_char do |ch|
    individual_numbers.unshift(numerals[ch])
  end

  i = 0
  while i < individual_numbers.length

    if i == individual_numbers.length - 1
      res += individual_numbers[i]

      i += 1
    elsif individual_numbers[i] > individual_numbers[i + 1]
      res += (individual_numbers[i] - individual_numbers[i + 1])

      i += 2
    else
      res += individual_numbers[i]

      i += 1

    end
  end
  res
end

p roman_to_int('DCCXVI')
p roman_to_int('CDXCIV')

def integer_to_roman(integer)

  numerals = {
    'I' => 1,
    'II' => 2,
    'III' => 3,
    'IV' => 4,
    'V' => 5,
    'VI' => 6,
    'VII' => 7,
    'VIII' => 8,
    'IX' => 9,
    'X' => 10,
    'XX' => 20,
    'XXX' => 30,
    'XL' => 40,
    'L' => 50,
    'LX' => 60,
    'LXX' => 70,
    'LXXX' => 80,
    'XC' => 90,
    'C' => 100,
    'CC' => 200,
    'CCC' => 300,
    'CD' => 400,
    'D' => 500,
    'DC' => 600,
    'DCC' => 700,
    'DCCC' => 800,
    'CM' => 900,
    'M' => 1000,
    'MM' => 2000,
    'MMM' => 3000,
  }

  res = ''

  integer.to_s.reverse.chars.each_with_index do |digit, place|
    next if digit == '0'
    res += numerals.key(digit.to_i * 10 ** place).reverse
  end
  res.reverse

end

p integer_to_roman(494)
p integer_to_roman(50)
