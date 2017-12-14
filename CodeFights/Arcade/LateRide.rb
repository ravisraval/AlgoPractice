def lateRide(n)
    hours = n / 60
    mins = n - (hours * 60)
    res = hours.to_s.split("").map(&:to_i).reduce(:+)
    res += mins.to_s.split("").map(&:to_i).reduce(:+)
end
