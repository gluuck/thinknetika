num_of_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts 'Введите число'
  day = gets.to_i
puts 'Введите месяц'
  month = gets.to_i
puts 'Введите год'
  year = gets.to_i
num_of_days[1] = 29 if year % 4 == 0 || year % 400 == 0
if month >=2
  p num_of_days[0..(month-2)].inject(:+) + day
else
  p day
end
