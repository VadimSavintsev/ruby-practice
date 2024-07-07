def cashmachine(command)
    case command
    when "D"
        print "Введите сумму, которую хотите внести: \n"
        sum=gets.to_f
        if(sum>0)
            print "Сумма добавлена в баланс \n"
            $balance=$balance.to_f+sum
            print "Новый баланс: \n"
            puts $balance
            print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
            command=gets.chomp
            cashmachine(command.upcase)
        else
            print "Некоректно введена сумма! Сумма должна быть числом больше 0 \n"
            print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
            command=gets.chomp
            cashmachine(command.upcase)
        end
    when "W"
        print "Введите сумму, которую хотите снять: \n"
        sum=gets.to_f
        if(sum>0 && sum<=$balance.to_f)
            print "Сумма успешно снята \n"
            $balance=$balance.to_f-sum
            print "Новый баланс: \n"
            puts $balance
            print "Введите коммнду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
            command=gets.chomp
            cashmachine(command.upcase)
        else
            print "Некоректно введена сумма! Сумма должна быть числом больше 0 и меньше или равна балансу \n"
            print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
            command=gets.chomp
            cashmachine(command.upcase)
        end
    when "B"
        print "Текущий баланс: \n"
        puts $balance
        print "Введите комманду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
        command=gets.chomp
        cashmachine(command.upcase)
    when "Q"
        print "Программа закрыта \n"
        File.write("balance.txt", $balance)
    else
        print "Неправильно введена команда! \n"
        print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
        command=gets.chomp
        cashmachine(command.upcase)
    end                
end

$balance=File.read("balance.txt")
print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
command=gets.chomp
cashmachine(command.upcase)


