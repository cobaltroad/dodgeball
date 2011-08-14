class AddImageToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :image, :string
  end

  def self.down
    remove_column :leads, :image
  end
end
