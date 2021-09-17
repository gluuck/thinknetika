def fibonachi(num)
a, b = 0, 1
arr = []
while a < num
  arr << a
  a, b = b, a+b
end
p arr
end
fibonachi(100)
