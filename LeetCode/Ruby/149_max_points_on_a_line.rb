# Given n points on a 2D plane, find the maximum number of points that lie on the same straight line.
class Point
    attr_accessor :x, :y
    def initialize(x=0, y=0)
        @x = x
        @y = y
    end
end

def max_points(points)
    return 0 if points.empty?
    return 1 if points.length == 1
    return 2 if points.length == 2
    lines_hash = Hash.new { |h,k| h[k] = [] }
  points.each_with_index do |point, idx|
    points.each_with_index do |point2, jdx|
      next unless idx < jdx

      if point.y == point2.y
        if point.x == point2.x
           unless lines_hash[["p", point.x, point.y]].include?(idx)
             lines_hash[["p", point.x, point.y]].push(idx)
           end
           unless lines_hash[["p", point.x, point.y]].include?(jdx)
             lines_hash[["p", point.x, point.y]].push(jdx)
           end
         else
           unless lines_hash[["h", point.y]].include?(idx)
             lines_hash[["h", point.y]].push(idx)
           end
           unless lines_hash[["h", point.y]].include?(jdx)
             lines_hash[["h", point.y]].push(jdx)
           end
         end
         next
       elsif point.x == point2.x
         unless lines_hash[["v", point.x]].include?(idx)
           lines_hash[["v", point.x]].push(idx)
         end
         unless lines_hash[["v", point.x]].include?(jdx)
           lines_hash[["v", point.x]].push(jdx)
         end
         next
       end

      slope = (point2.y - point.y).fdiv(point2.x - point.x)

      b = point.y - (slope * point.x)

      lines_hash[[slope, b]].push(idx) unless lines_hash[[slope, b]].include?(idx)
      lines_hash[[slope, b]].push(jdx) unless lines_hash[[slope, b]].include?(jdx)
    end
  end
  points.each_with_index do |point, idx|
    points.each_with_index do |point2, jdx|
      next if idx == jdx

      if point.y == point2.y
        if point.x == point2.x
           unless lines_hash[["p", point.x, point.y]].include?(idx)
             lines_hash[["p", point.x, point.y]].push(idx)
           end
           unless lines_hash[["p", point.x, point.y]].include?(jdx)
             lines_hash[["p", point.x, point.y]].push(jdx)
           end
         else
           unless lines_hash[["h", point.y]].include?(idx)
             lines_hash[["h", point.y]].push(idx)
           end
           unless lines_hash[["h", point.y]].include?(jdx)
             lines_hash[["h", point.y]].push(jdx)
           end
         end
         next
       elsif point.x == point2.x
         unless lines_hash[["v", point.x]].include?(idx)
           lines_hash[["v", point.x]].push(idx)
         end
         unless lines_hash[["v", point.x]].include?(jdx)
           lines_hash[["v", point.x]].push(jdx)
         end
         next
       end

      slope = (point2.y - point.y).fdiv(point2.x - point.x)

      b = point.y - (slope * point.x)

      lines_hash[[slope, b]].push(idx) unless lines_hash[[slope, b]].include?(idx)
      lines_hash[[slope, b]].push(jdx) unless lines_hash[[slope, b]].include?(jdx)
    end
  end
  lines_hash.sort_by { |h, v| v.length }.last.last.length
end
