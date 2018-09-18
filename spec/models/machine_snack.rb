require 'rails_helper'

describe MachineSnack, type: :model do 
  describe 'Relationships' do
    it { shoul belong_to :machine }
    it { shoul belong_to :snack }
  end 
end 