arr = ('a'..'z').to_a
hash = {}
arr.each_with_index{|x,i| hash[x] = i+1 if x == 'a' || x == 'e' ||
                    x == 'i' || x == 'o' || x == 'u'}
p hash
