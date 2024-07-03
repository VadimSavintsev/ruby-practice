require 'rspec'

def greeting(name,surname,age)
    if(age<18)
        "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else
        "Привет, #{name} #{surname}. Самое время заняться делом!"
    end
end

RSpec.describe "lab_1_task_1" do
    it "#greeting" do
      expect(greeting("Vadim","Savintsev",20)).to eq("Привет, Vadim Savintsev. Самое время заняться делом!")
    end
end
