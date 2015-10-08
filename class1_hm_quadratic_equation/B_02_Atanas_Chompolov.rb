def quadraticFormula(a, b, c)
  fRoot1 = (-b + Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)
  fRoot2 = (-b - Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)

  printf("%.2f,%.2f\n", fRoot2, fRoot1)

end

a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

p quadraticFormula(a, b, c)

