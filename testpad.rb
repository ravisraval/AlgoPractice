# Step 1: min_by_key
# Throughout this interview, we'll pretend we're building a new analytical database. Don't worry about actually building a database though – these will all be toy problems.
# Here's how the database works: all records are represented as maps, with string keys and integer values. The records are contained in an array, in no particular order.
# To begin with, the database will support just one function: min_by_key. This function scans the array of records and returns the record that has the minimum value for a specified key. Records that do not contain the specified key are considered to have value 0 for the key. Note that keys may map to negative values!
# Here's an example use case: each of your records contains data about a school student. You can use min_by_key to answer questions such as "who is the youngest student?" and "who is the student with the lowest grade-point average?"
# Implementation notes:
# You should handle an empty array of records in an idiomatic way in your language of choice.
# If several records share the same minimum value for the chosen key, you may return any of them.



# Step 2: first_by_key
# Our next step in database development is to add a new function. We'll call this function first_by_key. It has much in common with min_by_key.  first_by_key takes three arguments:
# a string key
# a string sort direction (which must be either "asc" or "desc")
# an array of records, just as in min_by_key.
# If the sort direction is "asc", then we should return the minimum record, otherwise we should return the maximum record. As before, records without a value for the key should be treated as having value 0.
# Once you have a working solution, you should re-implement min_by_key in terms of first_by_key .


# Step 3: first_by_key comparator
# As we build increasingly rich orderings for our records, we'll find it useful to extract the comparison of records into a comparator. This is a function or object (depending on your language) which determines if a record is "less than", equal, or "greater than" another.
# In object-oriented languages, you should write a class whose constructor accepts two parameters: a string key and a string direction. The class should implement a method compare that takes as its parameters two records. This method should return -1 if the first record comes before the second record (according to key and direction), zero if neither record comes before the other, or 1 if the first record comes after the second.
# In functional languages, you should write a function which accepts two parameters: a string key and a string direction. The function should return a method that takes as its parameters two records. This function should return -1 if the first record comes before the second record (according to key and direction), zero if neither record comes before the other, or 1 if the first record comes after the second.
# You should then use your comparator in your implementation of first_by_key.


def assert_equal(actual, expected)
  unless actual == expected
    raise "Assertion failed: #{actual} does not match expected #{expected}"
  end
end

def test_min_by_key
  puts "35"
  assert_equal(
    min_by_key("a", [{"a" => 1, "b" => 2}, {"a" => 2}]),
    {"a" => 1, "b" => 2},
  )
  puts "40"
  assert_equal(
    min_by_key("a", [{"a" => 2}, {"a" => 1, "b" => 2}]),
    {"a" => 1, "b" => 2},
  )
  puts "45"
  assert_equal(
    min_by_key("b", [{"a" => 1, "b" => 2}, {"a" => 2}]),
    {"a" => 2},
  )
  puts "50"
  assert_equal(
    min_by_key("a", [{}]),
    {},
  )
  puts "55"
  assert_equal(
    min_by_key("b", [{"a" => -1}, {"b" => -1}]),
    {"b" => -1},
  )
end



def test_first_by_key
  assert_equal(first_by_key("a", "asc", [{"b" => 1}, {"b" => -2}, {"a" => 10}]), {"b" => 1}) # {"b" => -2} is also okay)
  assert_equal(first_by_key("a", "desc", [{"b" => 1}, {"b" => -2}, {"a" => 10}]), {"a" => 10})
  assert_equal(first_by_key("b", "asc", [{"b" => 1}, {"b" => -2}, {"a" => 10}]), {"b" => -2})
  assert_equal(first_by_key("b", "desc", [{"b" => 1}, {"b" => -2}, {"a" => 10}]), {"b" => 1})
  assert_equal(first_by_key("a", "desc", [{}, {"a" => 10, "b" => -10}, {}, {"a" => 3, "c" => 3}]), {"a" => 10, "b" => -10})
end



def test_record_comparator
  cmp = RecordComparator.new("a", "asc")
  assert_equal(cmp.compare({"a" =>1}, {"a" =>2}), -1)
  assert_equal(cmp.compare({"a" =>2}, {"a" =>1}), 1)
  assert_equal(cmp.compare({"a" =>1}, {"a" =>1}), 0)
end

class RecordComparator
  def initialize(key, sort_direction)
    @key = key
    @sort_direction = sort_direction
  end

  def compare(record1, record2)
    if @sort_direction == 'asc'
      record1.fetch(@key, 0) <=> record2.fetch(@key,0)
    else
      record2.fetch(@key, 0) <=> record1.fetch(@key,0)
    end
  end

end

#iterate through students
#keep track of min for that particular key
#keep track of winning student

def min_by_key(key, students)
  first_by_key(key, 'asc', students)
end

def first_by_key(key, sort_direction, students)
  comparer = RecordComparator.new(key, sort_direction)
  latest_student = nil

  students.each do |student|

    if latest_student.nil?
      latest_student = student

    elsif comparer.compare(student, latest_student) == -1
      latest_student = student
    end

  end

  latest_student
end


def main
  test_min_by_key
  test_first_by_key
  test_record_comparator
end

main
