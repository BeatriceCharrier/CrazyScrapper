require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"


#Version Badass !
page = Nokogiri::HTML(open(PAGE_URL))   

def name_patch(page, i)
    name = page.xpath('//*[@class="link-secondary"]')[i].text
    return name
end

def price_patch(page, i)
    price = page.xpath('//*[@class="price"]')[i].text
    return price
end

def list_crypto(page)
    list_crypto = Array.new
    

    #page.xpath('//*[@id="currencies-all"]/tbody/tr').length.
    #A la place de 10.times mais c'est très long
    10.times do |i|
        list_crypto << {"#{name_patch(page, i)}": "#{price_patch(page, i)}"}
    end
    return list_crypto
end 



#Version simplifié mais pas en cohérence avec l'énoncer
def second_crypto(page)
    excel = Hash.new
    name_crypto = Array.new
    price_crypto = Array.new

    page.xpath('//*[@class="link-secondary"]').each do |node|
        name_crypto << node.text
    end
    page.xpath('//*[@class="price"]').each do |node|
        price_crypto << node.text
    end

    excel = name_crypto.zip(price_crypto)

    excel.each do |key, value|
        puts "#{key} : #{value}"
    end 
end


def perform(page)
    puts "Salut, alors j'ai 2 versions pour toi."
    puts "1: Version simple pour les noobs"
    puts "2: Version Badass !"
    input = 0
    
    while input != 1 && input != 2
        puts "Tape 1 ou 2 :)"
        input = gets.chomp.to_i
        
        if input == 1
            puts list_crypto(page)
        elsif input == 2
            second_crypto(page)
        else
            puts "J'ai dit ! 1 ou 2 !!!"
        end
    end
end

puts perform(page)




