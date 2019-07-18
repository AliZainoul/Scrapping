require 'nokogiri'
require 'pry'
require 'open-uri'

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{townhall_url[1..-1]}")) #Selecting over all townhall_urls
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  town_name = townhall_url[5..-6] #Selecting over the http://annuaire-des-mairies.com/95/==>SELECTION<==.html
  { town_name => email } #Creating a Hash 
end

def get_townhall_urls
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  page.xpath("//a[@class='lientxt']/@href")
end

def perform
  array_townhall_urls = Array.new
  array_url_name = get_townhall_urls   #For an array of all url names
  array_url_name.each do |url| array_townhall_urls << get_townhall_email(url.text) end
  puts array_townhall_urls
end
perform
