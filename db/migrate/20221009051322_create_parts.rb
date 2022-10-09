class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.string :sku
      t.string :display_pn
      t.string :be_product_cat_name
      t.string :short_description
      t.string :lead_time
      t.string :meta_description
      t.string :meta_title
      t.string :part_status
      t.text :images
      t.text :attributes

      t.timestamps
    end
  end
end
