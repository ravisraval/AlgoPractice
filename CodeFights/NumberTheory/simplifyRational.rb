def simplifyRational(numerator, denominator)
    if denominator < 0
        denominator *= -1
        numerator *= -1
    end
    return [numerator, 1] if numerator == 0

    smaller_num = [numerator.abs, denominator].min
    2.upto(smaller_num).each do |pot_factor|
        while numerator % pot_factor == 0 &&
              denominator % pot_factor == 0

        numerator /= pot_factor
        denominator /= pot_factor
        end
    end
    [numerator, denominator]
end
