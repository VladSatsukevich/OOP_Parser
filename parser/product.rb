require_relative 'csv_modules'


class Product

  attr_accessor :name, :price, :image
  
    def initialize (name, price, image)
      @name = name
      @price = price
      @image = image
    end

    protected
    def save
      Csv_modules.new(name, price, image).csv_add
    end
end


