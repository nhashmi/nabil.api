class AddWeeklyAttributesToRecord < ActiveRecord::Migration
  def change
    add_column :records, :citizenship, :boolean
    add_column :records, :reading, :boolean
    add_column :records, :work, :boolean
    add_column :records, :family, :integer
    add_column :records, :extended_family, :integer
    add_column :records, :bored, :boolean
    add_column :records, :diy, :boolean
  end
end
