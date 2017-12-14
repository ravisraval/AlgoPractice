def maxMultiple(divisor, bound)
    idx = bound
    idx -= 1 until idx % divisor == 0
    idx
end
