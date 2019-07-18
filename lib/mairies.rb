require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

PAGE_URL = "https://www.annuaire-des-mairies.com/val-d-oise.html"

page = Nokogiri::HTML(open(PAGE_URL))

#Donne les adresses mail
def get_townhall_email(page)
    name = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    return name
end

#Donne les villes
def get_townhall_urls(page)
    list = Array.new
    page.xpath('//a[starts-with(@href, "./")]').each do |town|
        list << town
    end
    return list
end

#puts get_townhall_email(page)
puts get_townhall_urls(page)

#<a class="lientxt" href="./95/ableiges.html">ABLEIGES</a>

#"https://www.annuaire-des-mairies.com/"+"/95/ableiges.html"