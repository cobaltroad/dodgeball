class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.string :product_name
      t.integer :sale_amount_in_cents
      t.text :notes
      t.references :player

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
