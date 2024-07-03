require 'rspec'

def foobar(number_1, number_2)
  if number_1 == 20 || number_2 == 20
    number_2
  else
    number_1+number_2
  end
end

RSpec.describe "lab_1_task_2" do
  it "#foobar" do
    expect(foobar(2,3)).to eq(5)
  end
end