require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

PAGE_URL = "https://www.annuaire-des-mairies.com/val-d-oise.html"

page = Nokogiri::HTML(open(PAGE_URL))

#Donne les adresses mail
def get_townhall_email(page)
    name = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    puts name
end

#Donne les villes
def get_townhall_urls(page)
    page.xpath('//*[@class="lientxt"]').each do |town|
        new_page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/#{town['href']}"))
        get_townhall_email(new_page)
    end
end

get_townhall_urls(page)
