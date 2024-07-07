require 'rspec'

def Check(word)
  if word[-2].upcase=="C" && word[-1].upcase=="S"
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
