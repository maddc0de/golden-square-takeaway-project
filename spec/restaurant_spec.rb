require 'restaurant'

RSpec.describe Restaurant do
  let(:restaurant) {Restaurant.new}

  it "returns list of dishes with prices" do
    expect(restaurant.dishes).to eq [{:dish=>"Pizza", :price=>12.45},
                                     {:dish=>"Oatcakes", :price=>8.55},
                                     {:dish=>"French Toast", :price=>9.15},
                                     {:dish=>"Noodles", :price=>10.55}]
  end

end