# coding: utf-8
=begin
Sum square difference
Problem 6

The sum of the squares of the first ten natural numbers is,
12 + 22 + ... + 102 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
=end

prods_three_digits = (100..999).to_a.map do |x|
  (x..999).to_a.map { |y| x*y }
end.inject(:+)

problem_006 = (1..10).reduce

puts "Answer: #{problem_006}"
