require 'thread'

require_relative 'product'
require_relative 'csv_modules'
require_relative 'utils'

include Utils

module Parsing

  @parameters = YAML.load_file('parameters.yaml')

    def self.product_parsing(file_name, url)
        downloaded_page = Utils.get_page(url + '.html')
        name  = downloaded_page.xpath(@parameters['name_xpath'])
        image = downloaded_page.xpath(@parameters['image_xpath'])
        variations = downloaded_page.xpath(@parameters['variations_xpath'])
        variations.each do |variation|
          price = variation.xpath(@parameters['price_xpath'])
          weigth = variation.xpath(@parameters['weigth_xpath'])
          Product.save(file_name, "#{name} - #{weigth}", price, image)
          #Csv_modules.csv_add(file_name, "#{name} - #{weigth}", price, image)
        end
    end

    def self.parse_category(file_name, category)
        number_of_products = Utils.get_page(category).xpath(@parameters['number_of_products_xpath']).text.to_i
        number_of_pages = (number_of_products / @parameters['page_number']).ceil
        page_parsing(file_name, category)
        (2..number_of_pages).each do |page_number|
          result = category + "?p=#{page_number}"
          page_parsing(file_name, result)
        end
    end

    def self.page_parsing(file_name, inputted_page)
        downloaded_page = Utils.get_page(inputted_page)
        parsed_product_url = downloaded_page.xpath(@parameters['parsed_product_url_xpath'])
        parsed_url_list = parsed_product_url.to_s.split(/.html/)
        puts "Start parsing products page:"
        threads = []
        parsed_url_list.map { |url_link| Thread.new do product_parsing(file_name, url_link) end }
            threads.map(&:join)
    end
end
