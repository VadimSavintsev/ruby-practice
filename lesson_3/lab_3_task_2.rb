#Есть файл, со следующей структурой и содержащий не менее 10 строк: Имя, фамилия и возраст
#Необходимо прочитать файл, затем запросив у пользователя ввод возраста.
#Найти в результатах чтения файла, студента чей возраст равен введённому числу и записать этого студента(студентов) в другой файл с названием results.txt.
#После этого перезапросить ввод.
#Программа завершается выводом на экран содержимого файла results.txt построчно, если все студенты из первого файла были записаны во второй
#Или если пользователь ввёл с клавиатуры -1.

BD_FILE='students.txt'
BUFFER = 'buffer.txt'
RESULT = 'results.txt'

def updateRes(num)
    file = File.open(BUFFER, 'a')
    File.foreach(BD_FILE).with_index do |actor, index|
        age = actor.split[2]
        file.puts actor if num.to_i == age.to_i
    end
    file.close
end

File.open(BUFFER, 'w')
agePut=1
ageMassiv = []
puts 'Введите возраст для записи подходящих людей'
agePut = gets.to_i
ageMassiv.push(agePut)
updateRes(agePut)
while agePut!=-1
    if BUFFER.size == BD_FILE.size
        puts 'Добавлены все люди из файла'
        break
    end
    puts 'Введите возраст для записи подходящих людей'
    agePut = gets.to_i
    for i in ageMassiv
        count = 0
        if i == agePut
            count += 1
            puts 'Введите другое число'
            break
        end
    end
    if count == 0 && agePut != -1
        ageMassiv.push(agePut)
        updateRes(agePut)
    end
    File.write(RESULT, File.read(BUFFER))
    file1 = File.open("students.txt")
    file2 = File.open("results.txt")
    if file1.size== file2.size
        puts 'Добавлены все люди из исходного файла'
        break
    end
end
file = File.open(BUFFER, 'w')
file.close
