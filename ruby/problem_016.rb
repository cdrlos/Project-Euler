=begin
Power digit sum
Problem 16

215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?
=end

answer_016 = 0
(2**1000).to_s.each_byte { |b| answer_016 += b.char.to_i }

puts "Answer: #{answer_016}\n"
