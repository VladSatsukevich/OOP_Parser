require 'thread'

require_relative 'product'
require_relative 'csv_modules'
require_relative 'utils'

include Utils
include CSV_modules

module Parsing

    def self.product_parsing(file_name, url)
        downloaded_page = Utils.get_page(url + '.html')
        name  = downloaded_page.xpath('//h1[@class = "product_main_name"]/text()')
        image = downloaded_page.xpath('//img[@class = "replace-2x img-responsive"]/@src')
        variations = downloaded_page.xpath('//div[contains(@class, "attribute_list")]/ul/li')
        variations.each do |variation|
          price = variation.xpath('.//span[@class = "price_comb"]/text()')
          weigth = variation.xpath('.//span[@class = "radio_label"]/text()')
          Product.new(name, price, image)
          CSV_modules.csv_add(file_name, "#{name} - #{weigth}", price, image)
        end
    end

    def self.parse_category(file_name, category)
        parameters = YAML.load_file('parameters.yaml')
        number_of_products = Utils.get_page(category).xpath('//input[@id="nb_item_bottom"]/@value').text.to_i
        number_of_pages = (number_of_products / parameters['page_number']).ceil
        page_parsing(file_name, category)
        (2..number_of_pages).each do |page_number|
          result = category + "?p=#{page_number}"
          page_parsing(file_name, result)
        end
    end

    def self.page_parsing(file_name, inputted_page)
        downloaded_page = Utils.get_page(inputted_page)
        parsed_product_url = downloaded_page.xpath("//*[@class = 'product_img_link pro_img_hover_scale product-list-category-img']/@href")
        parsed_url_list = parsed_product_url.to_s.split(/.html/)
        puts "Start parsing products page:"
        threads = []
        parsed_url_list.map { |url_link| Thread.new do product_parsing(file_name, url_link) end }
            threads.map(&:join)
    end
end