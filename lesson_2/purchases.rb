purchses = {}
while 1 > 0
  puts 'Введите название товара или stop для выхода'
  product = gets.chomp.downcase
  if product == 'stop'
    break
  end
  puts 'Введите количество товара'
  qunttity = gets.to_f
  puts 'Введите цену единицы товара'
  sum = gets.to_f
  purchses[product] = {'количество'=> qunttity, 'цена' => sum, 'сумма' => qunttity*sum}
end
r = 0
purchses.each do |_,v|
  r += v['сумма']
end
puts purchses
puts "сумма всех покупок: #{r} $"
