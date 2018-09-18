require 'rails_helper' 

describe Snack, type: :model do 
  describe 'Validations' do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end 
  
  describe 'Relationships' do 
    it { should have_many :machine_snacks}
    it { should have_many :machines}
  end 
end 