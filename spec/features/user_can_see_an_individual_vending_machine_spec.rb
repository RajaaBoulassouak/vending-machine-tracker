require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  
  it 'they see name and price of all machine snacks' do 
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: 'cheetos', price: 3)
    snack_2 = dons.snacks.create(name: 'cheetos', price: 7)
    
    visit machine_path(dons)
    
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content("Price: #{snack_1.price}")
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content("Price: #{snack_2.price}")
    expect(page).to have_content("Average Price: #{5}")
  end
end
