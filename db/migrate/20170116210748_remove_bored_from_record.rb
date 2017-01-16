class RemoveBoredFromRecord < ActiveRecord::Migration
  def change
    remove_column :records, :bored
    remove_column :records, :bored_details
  end
end
