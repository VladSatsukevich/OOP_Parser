require 'thread'

require_relative 'product_parsing'
require_relative 'utils'

include Utils

module Page_parsing

  @parameters = YAML.load_file('parameters.yaml')

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
        parsed_url_list.map { |url_link| Thread.new do Product_parsing.product_parsing(file_name, url_link) end }
          threads.map(&:join)
    end
end