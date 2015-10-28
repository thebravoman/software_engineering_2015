require 'csv'

file = ARGV[0]
komanda = ARGV[1]
kolona = ARGV[2]
deistvie = ARGV[3]
min = ARGV[3]
max = ARGV[4]
market = CSV.read file

def sortnamal market, kolona
  if kolona == "1" 
    market.sort{|a,b| [a[0].to_s] <=> [b[0].to_s]}
  end

  if kolona == "2"
    market.sort{|a,b| [a[1].to_i] <=> [b[1].to_i]}
  end

  if kolona == "3"
    market.sort{|a,b| [a[2].to_i] <=> [b[2].to_i]}
  end

CSV.open("result.csv", "wb") do |result|
  market.each {|cell| result << cell}
end

end 

def sortuvel market, kolona
  if kolona == "1" 
    market.sort{|a,b| [a[0].to_s] <=> [b[0].to_s]}.reverse!
  end

  if kolona == "2"
    market.sort{|a,b| [a[1].to_i] <=> [b[1].to_i]}.reverse!
  end

  if kolona == "3"
    market.sort{|a,b| [a[2].to_i] <=> [b[2].to_i]}.reverse!
  end

CSV.open("result.csv", "wb") do |result|
  market.each {|cell| result << cell}
end

end 

def cena market, min, max
  CSV.open("result.csv", "w") do |csv|
    market.each do |a|
      if (a[2].to_i >= min) && (a[2].to_i <= max) 
      csv << a 
      end
    end
  end
end

if komanda == "sort" && deistvie == "ASC"
  sortnamal market, kolona

elsif  komanda == "sort" && deistvie == "DESC"
    sortuvel market, kolona

else komanda == "filter_cost"
	cena market, min, max

end
