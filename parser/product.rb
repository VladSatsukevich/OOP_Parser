require 'csv'

class Product

  attr_accessor :name, :price, :image
  
    def initialize (name, price, image)
      @name = name
      @price = price
      @image = image
    end

    def self.csv_create (file_name)
      puts "File #{file_name} was created!"
      CSV.open(file_name + ".csv", 'w') do |csv| csv << ["Name", "Price", "Image"] 
      end
    end

    def self.csv_add(file_name, name, price, image)
      CSV.open(file_name + ".csv", 'a') do |csv| csv << [name, price, image] 
      end
    end
end

