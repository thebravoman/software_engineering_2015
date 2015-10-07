def quadraticFormula(a, b, c)
  fRoot1 = nil
  fRoot2 = nil

  fRoot1 = (-b + Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)
  fRoot2 = (-b - Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)

  printf("%.2f,%.2f\n", fRoot1, fRoot2)

end

a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

puts quadraticFormula(a, b, c)

