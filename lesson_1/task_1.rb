def greeting(name,surname,age)
    if(age<18)
        print "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else
        print "Привет, #{name} #{surname}. Самое время заняться делом!"
    end
end

puts "Введите Имя"
name=gets.chomp
puts "Введите Фамилию"
surname=gets.chomp
puts "Введите возраст"
age=gets.to_i

greeting(name,surname,age)
