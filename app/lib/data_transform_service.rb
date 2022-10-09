require 'csv'

class DataTransformService

  # ==== This method does:
  #
  #  Iterates over the csv and transforms it into JSON documents
  #
  # ==== With params:
  #
  # @param file_path <String> - Path to the csv file to process
  #
  # ==== And returns:
  #
  # @return total_records_processed
  #
  # ==== And is used like:
  #
  # service.transform(csv_path)
  #
  def transform(file_path)
    Rails.logger.info("Processing file from location: [#{file_path}]")
    row_counter = 0

    CSV.open(file_path, 'r:UTF-8', headers: true) do |csv|
      # puts csv.first["sku"]
      csv.each do |csv_row|
        Rails.logger.debug("Processing row: #{csv_row}")
        row_counter += 1
      end
    end
    row_counter
  end
  
  # Takes a row from the parsed csv and formats to json 
  def formatHash(row)
  
  end

  def getFirstRow(file_path)
    csv_row = nil
    CSV.open(file_path, 'r:UTF-8', headers: true) do |csv|
    csv_row = csv.first
    end
    puts csv_row.inspect
    return csv_row
  end

end