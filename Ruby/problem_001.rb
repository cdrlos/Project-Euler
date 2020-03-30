=begin
Project Euler Problem 1:
=end

answer_001 = 0
(1..999).each do |number|
  if (number % 3 == 0) || (number % 5 == 0)
    answer_001 += number
  end
end

puts "Answer: #{answer_001}\n"

## Answer: 233168
