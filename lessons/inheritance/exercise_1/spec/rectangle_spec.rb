require "../lib/rectangle"

#Unskip the tests one-by-one, then edit the Rectangle class so that each test passes.
RSpec.describe Rectangle do
  it "exists" do
    r = Rectangle.new("blue", 5, 10)
  end

  it "has color, length, and width attributes" do
    r = Rectangle.new("blue", 5, 10)
    expect(r.color).to eq("blue")
    expect(r.length).to eq(5)
    expect(r.width).to eq(10)
  end

  it "can calculate area" do
    r = Rectangle.new("blue", 5, 10)
    expect(r.area).to eq(50)
  end

  it "can calculate perimeter" do
    r = Rectangle.new("blue", 5, 10)
    expect(r.perimeter).to eq(30)
  end
end