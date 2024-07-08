#Есть файл, со следующей структурой и содержащий не менее 10 строк: Имя, фамилия и возраст
#Необходимо прочитать файл, затем запросив у пользователя ввод возраста.
#Найти в результатах чтения файла, студента чей возраст равен введённому числу и записать этого студента(студентов) в другой файл с названием results.txt.
#После этого перезапросить ввод.
#Программа завершается выводом на экран содержимого файла results.txt построчно, если все студенты из первого файла были записаны во второй
#Или если пользователь ввёл с клавиатуры -1.

stud_info='students.txt'
buffer='buffer.txt'
result='results.txt'

def Updates(num)
    file=File.open(buffer, 'a')
    File.foreach(stud_info).with_index do |actor, index|
        age=actor.split[2]
        file.puts actor if num.to_i==age.to_i
    end
    file.close
end

File.open(buffer, 'w')
ageArray=[]
puts 'Введите возраст для записи подходящих людей'
age=gets.to_i
ageArray.push(age)
Updates(age)
while age!=-1
    if buffer.size==stud_info.size
        puts "Добавлены все люди из файла"
        break
    end
    puts "Введите возраст для записи подходящих людей"
    age=gets.to_i
    for num in ageArray
        count=0
        if num==ageArray
            count +=1
            puts "Введите другое число"
            break
        end
    end
    if count==0 && age!=-1
        ageArray.push(age)
        Updates(age)
    end
    File.write(result,File.read(buffer))
    file1=File.open("students.txt")
    file2=File.open("results.txt")
    if file1.size+2==file2.size
        puts "Добавлены все люди из исходного файла"
        break
    end
end
file=File.open(buffer,'w')
file.close
