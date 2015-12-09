require 'csv'
csv = CSV.read(ARGV[0],headers:true).select{|num| num[0] == ARGV[1]}
puts csv
