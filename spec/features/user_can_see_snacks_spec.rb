require 'rails_helper'

describe "on the vending machine show page" do
  it "shows name and price of snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "White Castle Burger", price: 350)
    snack2 = dons.snacks.create(name: "Pop Rocks", price: 150)
    snack3 = dons.snacks.create(name: "Flaming Hot Cheetos", price: 250)

    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
    expect(page).to have_content(snack3.name)
    expect(page).to have_content(snack3.price)
  end
end
