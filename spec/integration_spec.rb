require_relative '../lib/restaurant'
require_relative '../lib/order'
require_relative '../lib/order_receipt'
require_relative '../lib/confirmation'

RSpec.describe "Integration testing" do
  let(:restaurant) {Restaurant.new}
  let(:order) {Order.new(restaurant, Kernel)}

  describe "#show_menu behaviour" do
    it "returns a list of dishes with prices of the restaurant's menu" do
      expect(Kernel).to receive(:puts).with("Pizza, £12.99\nOatcakes, £8.49\nFrench Toast, £8.99\nNoodles, £10.55")
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
      expect(order.view_basket).to eq [{:dish=>"Pizza", :price=>12.99}]
    end

    it "checkouts order with added dishes in the basket" do
      receipt = OrderReceipt.new(restaurant, order, Kernel)
      expect(Kernel).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(Kernel).to receive(:gets).and_return("Pizza")
      expect(Kernel).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(Kernel).to receive(:gets).and_return("Noodles")
      expect(Kernel).to receive(:puts).with("Thank you for you order. Here is your receipt:")
      expect(Kernel).to receive(:puts).and_return("Pizza, £12.99\nNoodles, £10.55")
      order.add_dish
      order.add_dish
      order.checkout(receipt)
      
      
    end
  end

end
