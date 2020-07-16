=begin
Smallest multiple
Problem 5

2520 is the smallest number that can be divided by each of the numbers from 1 to
10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
=end

class Integer
  def max n
    if self > n
      self
    else
      n
    end
  end

  def min n
    if self > n
      n
    else
      self
    end
  end

  def my_gcd n
    p = self.max n
    q = self.min n
    r = p % q
    while (not r.zero?)
      p = q
      q = r
      r = p % q
    end
    q
  end

  def my_lcm n
    (self * n) / self.my_gcd(n)
  end
end

problem_005 = (1..20).to_a.inject { |x,y| x.my_lcm(y) }

puts "Answer: #{problem_005}"
