require_relative '../lib/order_receipt'

RSpec.describe OrderReceipt do
  describe "#print method" do
    it "prints the receipt with total" do
      io = double :io
      restaurant = double :restaurant
      order = double :order, view_basket: [{:dish=>"Pizza", :price=>12.99}, {:dish=>"Noodles", :price=>10.55}]
      receipt = OrderReceipt.new(restaurant, order, io)
      

      expect(io).to receive(:puts).with("Thank you for you order. Here is your receipt:")
      expect(io).to receive(:puts).with(["Dish: Pizza, Price: £12.99", "Dish: Noodles, Price: £10.55"])
      expect(io).to receive(:puts).with("Total Price: £23.54")
      receipt.print
    end
  end
end