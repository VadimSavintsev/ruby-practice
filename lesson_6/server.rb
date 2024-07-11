#Переписать банкомат из ЛЗ #4 (класс CashMachine) на работу с веб сервером.
#Необходимо заменить ввод и вывод данных (по условию изначальной задачи) на запросы, вместо работы с консолью.
#GET/deposit?value=
#GET/withdraw?value=
#GET/balance

require 'socket'
require './CashMachine.rb'

server=TCPServer.new('0.0.0.0',5080)

while connection=server.accept
    request=connection.gets

    method, full_path, protocol =request.split(" ")

    path, params=full_path.split("?")
    
    puts method
    puts path
    puts protocol
    puts params

    response=case path
    when "/"
        $balance=CashMachine.init
    when "/Deposit"
        'Input Deposit sum'
        sum=params.to_f
        CashMachine.deposit(sum)
    when "/Withdraw"
        'Input Withdraw sum'
        sum=params.to_f
        CashMachine.withdraw(sum)
    when "/Balance"
        CashMachine.tekBalance
    else
        "404"
    end

    status=response == "404" ? "404" : "200"

    connection.print "HTTP/1.1 #{status}\r\n"
    connection.print "Content-Type: text/html\r\n"
    connection.print "\r\n"
    connection.print response
    connection.close
end
