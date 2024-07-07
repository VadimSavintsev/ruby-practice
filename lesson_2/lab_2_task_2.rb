require 'json'

def pokemons
    puts "Сколько покемонов вы хотите добавить? \n"
    count=gets.to_i
    pokemons={}
    count.times do
        puts "Введите имя покемона \n"
        name=gets.chomp
        puts "Введите цвет покемона \n"
        color=gets.chomp
        pokemons[name]=color
    end
    puts pokemons.to_json
end

pokemons
