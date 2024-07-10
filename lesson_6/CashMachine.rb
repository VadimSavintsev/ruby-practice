class CashMachine
    def self.Deposit(sum)
        if(sum>0)
            $balance+=sum
            puts "Новый баланс: \n"
            puts sprintf("%.2f",$balance)
            return $balance.round(2)
        else
            puts "Некорректно введена сумма! Сумма должна быть больше нуля \n"
            return $balance.round(2)
        end
    end
    def self.Withdraw(sum)
        if(sum>0 && sum<=$balance)
            $balance-=sum
            puts "Новый баланс: \n"
            puts sprintf("%.2f",$balance)
            return $balance.round(2)
        else
            puts "Некорректно введена сумма! Сумма должна быть больше нуля и меньше или равно балансу \n"
            return $balance.round(2)
        end
    end
    def self.ShowBalance
        puts "Текущий баланс: "
        puts sprintf("%.2f",$balance)
        return $balance.round(2)
    end
    def self.init
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
        $balance=balance.round(2)
    end
end