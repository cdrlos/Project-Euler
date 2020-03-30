=begin
Largest prime factor
Problem 3

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

def largest_prime_factor n
  largest_factor = 2
  if n != 1
    while n > 1
      if 0 == (n % largest_factor)
        n /= largest_factor
      else
        largest_factor += 1
      end
    end
    largest_factor
  else
    n
  end
end

answer_003 = largest_prime_factor 600851475143

puts "Answer: #{answer_003}\n"

## Answer: 6857
