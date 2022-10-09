require 'rails_helper'
require "json-schema"
RSpec.describe DataTransformService do

  let!(:csv_path) { 'spec/csv/sample-part-data.csv'}
  let!(:service) { DataTransformService.new}
  let!(:schema) { schema = {
    "type" => "object",
    "required" => ["a"],
    "properties" => {
      "sku" => {"type" => "integer"},
      "display_pn" => {"type" => "string"},
      "be_product_cat_name" => {"type" => "string"},
      "short_description" => {"type" => "string"},
      "lead_time" => {"type" => "integer"},
      "meta_description" => {"type" => "string"},
      "meta_title" => {"type" => "string"},
      "part_status" => {"type" => "string"},
      "images" => {"type" => "array", "items" => {"type" => "string"}},
      "attributes" => {"type" => "array", "items" => {"type" => "string"}}
       }
      }
    }
  describe '#transform' do

    it 'should transform rows in the passed file from csv to JSON docs' do
      result = service.transform(csv_path)
      expect(result).to eql(25)

    end

  end
  
  describe '#formatHash' do

    it 'should format a given row to the expected hash format' do
      row = service.getFirstRow(csv_path)
      expect(JSON::Validator.validate(schema, service.formatHash(row))).to eql(true)
    end

  end

end