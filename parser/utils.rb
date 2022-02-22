require 'nokogiri'
require 'curb'

module Utils
    def get_page(inputted_page)
        page = Curl.get(inputted_page)
        downloaded_page = Nokogiri::HTML(page.body_str)
        puts "Scrapping #{inputted_page}..."
        return downloaded_page
    end
end