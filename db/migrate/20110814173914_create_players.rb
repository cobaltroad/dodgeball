class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.references :team
      t.integer :points
      t.string :name
      t.string :role
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
