class Product

  attr_accessor :file_name, :name, :price, :image
  
    def initialize (file_name, name, price, image)
      @file_name = file_name
      @name = name
      @price = price
      @image = image
    end

end


