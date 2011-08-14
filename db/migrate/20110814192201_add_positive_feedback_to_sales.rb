class AddPositiveFeedbackToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :positive_feedback, :boolean
  end

  def self.down
    remove_column :sales, :positive_feedback
  end
end
