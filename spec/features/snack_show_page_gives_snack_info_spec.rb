require 'rails_helper'

describe "when visiting the snack show page" do
  it "shows all information about the snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    turing = owner.machines.create(location: "Turing Basement")
    snack1 = dons.snacks.create(name: "White Castle Burger", price: 350)
    snack2 = dons.snacks.create(name: "Pop Rocks", price: 150)
    snack2 = turing.snacks.create(name: "Pop Rocks", price: 150)

    visit snack_path(snack1)

    expect(page).to have_content("Name: #{snack1.name}")
    expect(page).to have_content("Price: #{snack1.price}")
    expect(page).to have_content("Location: #{dons.location}, #{dons.stock}, #{dons.avg}")
    expect(page).to have_content("Location: #{turing.location}, #{turing.stock}, #{turing.avg}")

  end
end
