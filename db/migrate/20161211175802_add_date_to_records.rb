class AddDateToRecords < ActiveRecord::Migration
  def change
    add_column :records, :year, :integer
    add_column :records, :month, :integer
    add_column :records, :day, :integer
  end
end
