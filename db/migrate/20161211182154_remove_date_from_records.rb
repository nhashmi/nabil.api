class RemoveDateFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :year, :integer
    remove_column :records, :month, :integer
    remove_column :records, :day, :integer
  end
end
