require 'rails_helper'

describe "on the vending machine show page" do
  it "shows the averge price of all the items" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "White Castle Burger", price: 350)
    snack2 = dons.snacks.create(name: "Pop Rocks", price: 150)
    snack3 = dons.snacks.create(name: "Flaming Hot Cheetos", price: 250)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: 250")
  end
end
