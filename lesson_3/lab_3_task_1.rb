ACTORS_LIST_PATH='artists.txt'
BUFFER='buffer.txt'

def index
    File.foreach(ACTORS_LIST_PATH) {|actor| puts actor}
end

def find(id)
    File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
        puts actor if id==index
    end
end

def where(pattern)
    file=File.open(ACTORS_LIST_PATH)
    file_date=file.read.split("\n")
    File.foreach(ACTORS_LIST_PATH).with_index do |val,index|
        if val.include?(pattern)
            puts file_date[index]
        end
    end
end

def update(id, name)
    file=File.open(BUFFER, 'w')
    File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
        file.puts(id==index ? name : actor)
    end
    file.close
    File.write(ACTORS_LIST_PATH, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
    file=File.open(BUFFER, 'w')
    File.foreach(ACTORS_LIST_PATH).with_index do |actor, index|
        if id!=index
            file.puts(actor)
        end
    end
    file.close
    File.write(ACTORS_LIST_PATH, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
end

def create(name)
    File.write(ACTORS_LIST_PATH, name+"\n", mode: 'a')
    
end

print "\n"
print "Содержимое файла: \n"
index
print "\n"
print "Нахождение конкретной строки и выводит её: \n"
find(1)
print "\n"
print "Нахождение всех строк, где есть указан паттерн: \n"
where("Mat")
print "\n"
print "Обновление конкретной строки файла: \n"
print "\n"
update(2, "Donnie Yen")
index
print "Удаление строки: \n"
print "\n"
delete(7)
index
print "Добавление строки в конец файла: \n"
print "\n"
create("Henry Cavill")
index
