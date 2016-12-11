class AddWeeklyAttributesToRecord < ActiveRecord::Migration
  def change
    add_column :records, :citizenship, :text
    add_column :records, :reading, :text
    add_column :records, :work, :text
    add_column :records, :family, :integer
    add_column :records, :extended_family, :integer
    add_column :records, :bored, :text
    add_column :records, :diy, :text
  end
end
