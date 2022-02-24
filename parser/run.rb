require 'yaml'

require_relative 'product_parsing'
require_relative 'page_parsing'
require_relative 'csv_modules'

parameters = YAML.load_file('parameters.yaml')
CSV_modules.csv_create(parameters['file'])
Page_parsing.parse_category(parameters['file'], parameters['link'])
