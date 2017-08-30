#aaron's better version - insert O(1)
# class TempTracker
#  def initialize
#    @hash = Hash.new(0)
#    @total_sum = 0
#    @count = 0
#    @greatest_count = 0
#    @max = nil
#    @min = nil
#  end
#
#  def insert(val)
#    @hash[val] += 1
#    @max = val if val > @max
#    @min = val if val < @min
#    @count += 1
#    if @hash[val] > greatest_count
#      @greatest_count += 1
#      @mode = @hash[val]
#    end
#    @total_sum += val
#  end
#
#  def get_max
#    @max
#  end
#
#  def get_min
#    @min
#  end
#
#  def get_mean
#    @total_sum / @count
#  end
#
#  def get_mode
#    @mode
#  end
# end

class TempTracker

  def initialize
    @store = Hash.new(0)
  end

  def insert(temp)
    @store[temp] += 1

    if @max.nil? || temp > @max
      @max = temp
    end

    if @min.nil? || temp < @min
      @min = temp
    end

    sum = 0
    @store.each do |temp, freq|
      sum += temp * freq
    end
    @mean = sum.fdiv(@store.values.reduce(:+))

    sorted_freq = @store.sort_by { |temp, freq| freq }
    @mode = sorted_freq.last.first

  end

  def get_max
    p @max
  end

  def get_min
    p @min
  end

  def get_mean
    p @mean
  end

  def get_mode
    p @mode
  end

end


tracker = TempTracker.new

tracker.insert(5)
p 'min'
tracker.get_min
p 'max'
tracker.get_max
p 'mean'
tracker.get_mean
p 'mode'
tracker.get_mode
puts "---------------------------------------"
tracker.insert(5)
tracker.get_min
tracker.get_max
p 'mean'
tracker.get_mean
p 'mode'
tracker.get_mode
puts "---------------------------------------"
tracker.insert(0)
tracker.get_min
tracker.get_max
p 'mean'
tracker.get_mean
p 'mode'
tracker.get_mode
puts "---------------------------------------"
tracker.insert(0)
tracker.get_min
tracker.get_max
p 'mean'
tracker.get_mean
p 'mode'
tracker.get_mode
puts "---------------------------------------"
