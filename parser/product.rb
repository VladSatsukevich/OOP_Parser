require_relative 'csv_modules'

class Product

  @@name
  @@price
  @@image
  @@file_name

  attr_accessor :name, :price, :image

  def initialize(name, price, image)
    @name = name
    @price = price
    @image = image
  end

  private
    def Product.save(name, price, image, file_name)
      Csv_modules.csv_add(name, price, image, file_name)
    end
  
end
