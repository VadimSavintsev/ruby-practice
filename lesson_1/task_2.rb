#Написать метод foobar, который принимает пару чисел, если
# хотя бы одно равно 20 - возвращает второе число, в противном случае
# выводит сумму этих чисел.

def foobar(number_1, number_2)
    if number_1 == 20 || number_2 == 20
        puts number_2
    else
        print number_1+number_2
    end
end
puts "Введите 1-ое число:"
number_1=gets.to_i
puts "Введите 2-ое число:"
number_2=gets.to_i
puts "Результат:"
foobar(number_1,number_2)
