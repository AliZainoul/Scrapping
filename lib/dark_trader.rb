require 'nokogiri'
require 'open-uri'

def crypto_scrapper_symbol (page)
  symbol_currency_array = []
  page.xpath('//*[@class = "text-left col-symbol"]').each do |symbol| symbol_currency_array << symbol.text end
  return symbol_currency_array
end

def crypto_scrapper_price (page)
  price_currency_array = []
  page.xpath('//*[@class = "price"]').each do |price| price_currency_array << price.text end
  return price_currency_array
end

def concatenate (tab_1, tab_2)
  full_array = tab_1.zip(tab_2)
  array_of_hashs = []
  full_array.each {|record| array_of_hashs << {record[0] => record[1]} }
  return array_of_hashs
end

def perform
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  symbol_currency_array = crypto_scrapper_price (page)
  price_currency_array = crypto_scrapper_symbol (page)
  array_of_hashs = concatenate(price_currency_array, symbol_currency_array)
  puts array_of_hashs
end

perform
