require_relative '../lib/dark_trader'

describe "the crypto_scrapper_symbol method" do
  it "should return an array of not nil elements" do
    expect(crypto_scrapper_symbol("https://coinmarketcap.com/all/views/all/").class).eq_to(Array)
end

describe "the crypto_scrapper_price method" do
  it "should return an array of not nil elements" do
    expect(crypto_scrapper_price("https://coinmarketcap.com/all/views/all/").class).eq_to(Array)
  end
end
