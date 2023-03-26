require_relative '../lib/order'

RSpec.describe Order do
  let(:restaurant) {double :restaurant, dishes: [
    {:dish => "Pizza", :price => 12.45},
    {:dish => "Oatcakes", :price => 8.55},
    {:dish => "French Toast", :price => 9.15},
    {:dish => "Noodles", :price => 10.55}
    ] }

  let(:io) {double :io}
  let(:order) {Order.new(restaurant, io)}
  
  context "initially" do
    it "displays a message that basket is empty when there is no added dishes given" do
      expect(io).to receive(:puts).with("Your basket is currently empty.")
      order.view_basket
    end

    it "raises an error when basket is empty during checkout" do
      receipt = double :OrderReceipt
      order_receipt = double :receipt
      expect{ order.checkout(receipt) }.to raise_error "There is nothing to checkout, basket is empty."
    end
  end
  
  describe "#show_menu behaviour" do
    it "returns a list of dishes with prices of the restaurant's menu" do
      expect(io).to receive(:puts).with("Pizza, £12.45\nOatcakes, £8.55\nFrench Toast, £9.15\nNoodles, £10.55")
      order.show_menu
    end
  end

  context "when making an order" do
    it "adds and removes dishes to basket" do
      expect(io).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(io).to receive(:gets).and_return("Pizza")
      expect(io).to receive(:puts).with("Please type the dish you want to add to the basket:")
      expect(io).to receive(:gets).and_return("Noodles")
      expect(io).to receive(:puts).with("Please type the dish you want to remove from the basket:")
      expect(io).to receive(:gets).and_return("Noodles")
      order.add_dish
      order.add_dish
      order.remove_dish
      expect(order.view_basket).to eq [{:dish=>"Pizza", :price=>12.99}]
    end
  end

end