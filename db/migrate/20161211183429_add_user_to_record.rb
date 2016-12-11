class AddUserToRecord < ActiveRecord::Migration
  def change
    remove_reference :records, :user, foreign_key: true
    add_reference :records, :user, index: true, foreign_key: true
  end
end
