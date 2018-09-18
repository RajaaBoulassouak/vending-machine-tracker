require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  
  describe 'Relationships' do 
    it { should have_many :machine_snacks }
    it { should have_many :snacks }
  end
  
  describe 'Class Methods' do 
    it "should calculate the average_price of all machine's snacks" do
      owner = Owner.create(name: 'Rajaa')
      rajaas = owner.machines.create(location: 'Denver')
      snack_1 = rajaas.snacks.create(name: 'Seeds', price: 8)
      snack_2 = rajaas.snacks.create(name: 'Water', price: 6)
    
      expected = 7
      actual = rajaas.average_price
    
      expect(actual).to eq(expected)
    end
    
    it "should count all machine's snacks" do
      owner = Owner.create(name: 'Rajaa')
      rajaas = owner.machines.create(location: 'Denver')
      snack_1 = rajaas.snacks.create(name: 'Water', price: 3)
      snack_2 = rajaas.snacks.create(name: 'Tee', price: 3)
      
      expected = 2
      actual = rajaas.snack_count
      
      expect(actual).to eq(expected)
    end
  end
end
