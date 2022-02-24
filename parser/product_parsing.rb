require_relative 'utils'
require_relative 'csv_modules'

include Utils
include CSV_modules

class Product_parsing

  @parameters = YAML.load_file('parameters.yaml')

  attr_accessor :name, :price, :image
  
    def initialize (name, price, image)
      @name = name
      @price = price
      @image = image
    end

    def self.product_parsing(file_name, url)
      downloaded_page = Utils.get_page(url + '.html')
      name  = downloaded_page.xpath(@parameters['name_xpath'])
      image = downloaded_page.xpath(@parameters['image_xpath'])
      variations = downloaded_page.xpath(@parameters['variations_xpath'])
      variations.each do |variation|
        price = variation.xpath(@parameters['price_xpath'])
        weigth = variation.xpath(@parameters['weigth_xpath'])
        CSV_modules.csv_add(file_name, "#{name} - #{weigth}", price, image)
      end
  end

end

