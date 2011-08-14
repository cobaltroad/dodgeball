class AddRuleTypeToRules < ActiveRecord::Migration
  def self.up
    add_column :rules, :rule_type, :string
    add_column :rules, :threshold, :integer
  end

  def self.down
    remove_column :rules, :threshold
    remove_column :rules, :rule_type
  end
end
