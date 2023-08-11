require './lib/dog'

RSpec.describe Dog do

  it "can exist as an instance" do
    fluffy = Dog.new("Fluffy")
  end

  it "can bark" do
    fluffy = Dog.new("Fluffy")
    expect(fluffy.bark).to eq("Fluffy goes Bark!")
  end

  it "can woof" do
    fluffy = Dog.new("Fluffy")
    expect(fluffy.woof).to eq("Woof!")
  end

  it "can always bark" do
    expect(Dog.woof).to eq("Self woof!")
  end

end