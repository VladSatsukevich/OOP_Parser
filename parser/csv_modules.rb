require 'csv'

module Csv_modules

    def self.csv_add (file_name, name, price, image)
        CSV.open(file_name + ".csv", 'a') do |csv| 
            csv << [name, price, image] 
        end
    end
    
    def self.csv_create (file_name)
        CSV.open(file_name + ".csv", 'w') do |csv|
        csv << ["Name", "Price", "Image"]
        puts "File #{file_name} was created!"
        end
    end
end
