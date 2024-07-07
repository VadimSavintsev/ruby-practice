def Check(word)
    word.upcase
    if (word[-2]=="C" || word[-2]=="c") && (word[-1]=="S" || word[-1]=="s")
        puts 2**word.length
    else
        puts word.reverse
    end
end

puts "Введите слово (на английском):"
word=gets.chomp
Check(word)
