require '../lib/ceo'
require 'pry'

RSpec.describe Ceo do

  describe "setup" do
    it "exists" do
      ceo = Ceo.new(15,20,'Tim',111)
      expect(ceo).to be_a Ceo
    end
    it "has base_salary and bonus attributes" do
      ceo = Ceo.new(15,20,'Tim',111)
      expect(ceo.base_salary).to eq(15)
      expect(ceo.bonus).to eq(20)
    end
  end

  describe "Has a name, ID, and total_compensation" do
    it "has a name and id" do
      ceo = Ceo.new(15,20,'Tim',111)
      expect(ceo.name).to eq('Tim')
      expect(ceo.id).to eq(111)
    end

    it "has a total compensation" do
      ceo = Ceo.new(15,20,'Tim',111)
      
      expect(ceo.total_compensation).to eq(35)
    end
    # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
    # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
  end

end