require_relative '../lib/restaurant'
require_relative '../lib/order'
require_relative '../lib/order_receipt'
require_relative '../lib/confirmation'

RSpec.describe "Integration testing" do
  let(:restaurant) {Restaurant.new}
  let(:order) {Order.new(restaurant, Kernel)}

  describe "#show_menu behaviour" do
    it "returns a list of dishes with prices of the restaurant's menu" do
      expect(Kernel).to receive(:puts).with("Pizza, £12.45\nOatcakes, £8.55\nFrench Toast, £9.15\nNoodles, £10.55")
      order.show_menu
    end
  end

  context "when making an order" do
    it "adds and removes dishes to basket" do
      expect(Kernel).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(Kernel).to receive(:gets).and_return("Pizza")
      expect(Kernel).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(Kernel).to receive(:gets).and_return("Noodles")
      expect(Kernel).to receive(:puts).with("Please type the dish you want to remove from the basket:")
      expect(Kernel).to receive(:gets).and_return("Noodles")
      order.add_dish
      order.add_dish
      order.remove_dish
      expect(order.view_basket).to eq [{:dish=>"Pizza", :price=>12.45}]
    end

    xit "checkouts order with added dishes in the basket" do
      expect(Kernel).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(Kernel).to receive(:gets).and_return("Pizza")
      expect(Kernel).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(Kernel).to receive(:gets).and_return("Noodles")
      order.add_dish
      order.add_dish
      order.checkout
      
      
    end
  end

end
