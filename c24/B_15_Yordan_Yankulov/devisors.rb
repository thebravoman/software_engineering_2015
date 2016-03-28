class Integer
  def factors() (1..self).select { |n| (self % n).zero? } end
end
p ARGV[0].to_i.factors
