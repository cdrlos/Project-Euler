# coding: utf-8
=begin
Problem 6
=end

prods_three_digits = (100..999).to_a.map do |x|
  (x..999).to_a.map { |y| x*y }
end.inject(:+)

problem_006 = (1..10).reduce

puts "Answer: #{problem_006}"
