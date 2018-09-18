
require 'rails_helper' 
  
describe 'When a user visits a snack show page' do 
  it 'they see all information about that snack' do 
    owner = Owner.create(name: 'Rajaa')
    rajaas_1 = owner.machines.create(location: 'Denver')
    rajaas_2 = owner.machines.create(location: 'Seattle')

    snack_1 = rajaas_1.snacks.create(name: 'Seeds', price: 4)
    snack_2 = rajaas_1.snacks.create(name: 'Water', price: 6)
    rajaas_2.snacks << snack_1
    snack_4 = rajaas_2.snacks.create(name: 'Tee', price: 2)
    snack_5 = rajaas_2.snacks.create(name: 'Cake', price: 3)
  
    visit snack_path(snack_1)
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content("Price: #{snack_1.price}")
    expect(page).to have_content(rajaas_1.location)
    expect(page).to have_content(rajaas_2.location)
    expect(page).to have_content("Average Price: #{rajaas_1.average_price}")
    expect(page).to have_content("Average Price: #{rajaas_2.average_price}")
    expect(page).to have_content("Snack Count: #{rajaas_2.snack_count}")
    expect(page).to have_content("Snack Count: #{rajaas_2.snack_count}")
  end
end
      