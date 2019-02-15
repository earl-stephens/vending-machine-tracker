require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end

  describe "relationships" do
    it { should belong_to :machine }
  end

  describe "class methods" do
    it "should show average price of all the items" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = dons.snacks.create(name: "White Castle Burger", price: 350)
      snack2 = dons.snacks.create(name: "Pop Rocks", price: 150)
      snack3 = dons.snacks.create(name: "Flaming Hot Cheetos", price: 250)

      expect(Snack.avg).to eq(250)
    end
  end
end
