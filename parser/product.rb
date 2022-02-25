require_relative 'csv_modules'

class Product

  attr_accessor :name, :price, :image
  
  def initialize (name, price, image)
    @name = name
    @price = price
    @image = image
  
  end
  
  private
  def self.save 
    Csv_modules.csv_add(name, price, image)
  end
  
end


