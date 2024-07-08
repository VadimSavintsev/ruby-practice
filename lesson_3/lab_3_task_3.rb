#Написать программу, которая начинается с чтения банковского баланса клиента из файла с именем balance.txt.
#Этот файл содержит одну строку со стартовым балансом клиента. Если файл не существует, используйте стартовый баланс 100.0, который должен быть константой.
#После этого программа повторно предложит клиенту внести деньги, вывести деньги, проверить баланс или выйти, используя буквы D (deposit), W (withdraw), B(balance) и Q(quit).
#Программа должна принимать на вход значения в верхнем или нижнем регистре.
#Для депозитов (D), программа подсказывает сумму. Сумма должна быть больше нуля. 
#Если сумма действительна, программа добавляет сумму депозита к балансу клиента и отображает новый баланс.
#При сняти средств (W) программа выдаст запрос на сумму. Сумма должна быть больше нуля и меньше или равна текущему балансу.
#Если сумма корректна, то программа вычитает сумму вывода из баланса клиента и отображает новый баланс.
#Для проверки баланса (B) программа просто выводит текущий баланс.
#Когда клиент решит выйти из программы (Q), программа запишет текущий баланс обратно в файл balance.txt.
#В случае неправильного ввода (команда или сумма), ваша программа должна выдать соответствующее сообщение об ошибке, которое говорит клиенту, как её исправить.

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


