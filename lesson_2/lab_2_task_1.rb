def Check(word)
    if word[-2].upcase=="C" && word[-1].upcase=="S"
        puts 2**word.length
    else
        puts word.reverse
    end
end

puts "Введите слово (на английском):"
word=gets.chomp
Check(word)
