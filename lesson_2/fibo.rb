a, b = 0, 1
arr = []
while a < 100
  arr << a
  a, b = b, a+b
end
p arr
