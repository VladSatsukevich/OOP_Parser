require 'yaml'

require_relative 'csv_modules'
require_relative 'parsing'

parameters = YAML.load_file('parameters.yaml')
CSV_modules.csv_create(parameters['file'])
Parsing.parse_category(parameters['file'], parameters['link'])