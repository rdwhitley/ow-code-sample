class FixAttributeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :parts, :attributes, :part_attributes
  end
end
