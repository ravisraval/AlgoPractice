# Given a collection of intervals, merge all overlapping intervals.
#
# For example,
# Given [1,3],[2,6],[8,10],[15,18],
# return [1,6],[8,10],[15,18].

# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
    return [] if intervals.empty?
    intervals.sort_by! { |a| a.start }
    idx = 0
    while idx < intervals.length - 1
        if intervals[idx].end >= intervals[idx + 1].start
            intervals[idx].end = [intervals[idx + 1].end, intervals[idx].end].max
            intervals.delete_at(idx + 1)
        else
            idx += 1
        end
    end
    intervals
end
