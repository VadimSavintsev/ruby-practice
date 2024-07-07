require 'rspec'

def Check(word)
  word.upcase
  if (word[-2]=="C" || word[-2]=="c") && (word[-1]=="S" || word[-1]=="s")
    2**word.length
  else
     word.reverse
  end
end

RSpec.describe "lab_2_task_1" do
    it "#Check" do
      expect(Check("brainCs")).to eq(128)
    end
end