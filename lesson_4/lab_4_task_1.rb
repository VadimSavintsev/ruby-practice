#Переписать банкомат из ЛЗ #3 на работу с классами.
#Класс должен называться -  CashMachine.
#Программа должна запускаться с помощью метода класса init, создавать экзепляр класса и взаимодействовать с пользователем согласно условиям задачи

class CashMachine
    def self.Deposit
        puts "Введите сумму, которую хотите внести: \n"
        sum=gets.to_f
        if(sum>0)
            $balance+=sum
            puts "Новый баланс: \n"
            puts sprintf("%.2f",$balance)
            return $balance
        else
            puts "Некорректно введена сумма! Сумма должна быть больше нуля \n"
        end
    end
    def self.Withdraw
        puts "Введите сумму, которую хотите вынести: \n"
        sum=gets.to_f
        if(sum>0 && sum<=$balance)
            $balance-=sum
            puts "Новый баланс: \n"
            puts sprintf("%.2f",$balance)
            return $balance
        else
            puts "Некорректно введена сумма! Сумма должна быть больше нуля и меньше или равно балансу \n"
        end
    end
    def self.ShowBalance
        puts "Текущий баланс: "
        puts sprintf("%.2f",$balance)
        return $balance
    end
    def init
        print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
        command=gets.chomp
        while command.upcase!="Q" do
            if command.upcase=="D"
                $balance=self.class.Deposit
                print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
                command=gets.chomp
            elsif command.upcase=="W"
                $balance=self.class.Withdraw
                print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
                command=gets.chomp
            elsif command.upcase=="B"
                $balance=self.class.ShowBalance
                print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
                command=gets.chomp
            else
                print "Неправильно введена команда! \n"
                print "Введите команду (D - добавить средства, W - снять средства, B - проверить баланс, Q - закрыть программу): \n"
                command=gets.chomp
            end
        end
        puts 'Программа закрыта'
        file=File.open("balance.txt", "w")
        file.puts $balance
        file.close
    end
end

const=100.0
if File.exist?("balance.txt")
    file=File.open("balance.txt","r")
    balance=file.read
    balance=balance.to_f
else
    file=File.new("balance.txt","w")
    file.puts const
    balance=const
end
$balance=balance
cashmachine=CashMachine.new
cashmachine.init
