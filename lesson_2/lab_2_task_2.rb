#Написать скрипт, который будет выводить массив покемонов
#-Спросит сколько добавить покемонов
#-Указанное на предыдущем этапе число раз спросит имя и цвет каждого покемона

def CountPok()
    puts 'Введите количество покемонов'
    count = gets.to_i
    return count
end

def AddPok(count)
    pokemons = {}
    while count.to_i > 0 do
        puts 'Имя покемона: '
        name = gets.chomp
        puts 'Цвет покемона: '
        color = gets.chomp
        pokemons[name] = color
        count = count.to_i - 1
    end
    return pokemons
end

def PrintPok(pokemons)
    puts pokemons
end

count = CountPok()
pokemons = AddPok(count)
PrintPok(pokemons)
