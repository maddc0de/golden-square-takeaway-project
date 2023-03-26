require 'restaurant'

RSpec.describe Restaurant do
  let(:restaurant) {Restaurant.new}

  it "returns list of dishes with prices" do
    expect(restaurant.dishes).to eq [{:dish=>"Pizza", :price=>12.99},
                                     {:dish=>"Oatcakes", :price=>8.49},
                                     {:dish=>"French Toast", :price=>8.99},
                                     {:dish=>"Noodles", :price=>10.55}]
  end

  it "returns total time it takes to prepare a given number of dishes and for it to be delivered in seconds" do
    expect(restaurant.process_time(2)).to eq 1200
  end

end