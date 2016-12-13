class AddUsertoRecord < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.boolean :running
      t.boolean :lifting
      t.float :dqs
      t.boolean :code
      t.boolean :writing
      t.boolean :business

      t.timestamps
    end
    add_reference :records, :user, foreign_key: true
  end
end
