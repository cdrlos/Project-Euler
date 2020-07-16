# coding: utf-8
=begin
Largest palindrome product
Problem 4

A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end

class Integer
  def palindrome?
    tmp = self
    rev = 0
    while tmp != 0
      rev = 10*rev + tmp % 10
      tmp /= 10
    end
    self == rev
  end
end

prods_three_digits = (100..999).to_a.map do |x|
  (x..999).to_a.map { |y| x*y }
end.inject(:+)

palindromes = prods_three_digits.select { |x| x.palindrome? }
problem_004 = palindromes.max

puts "Answer: #{problem_004}"
