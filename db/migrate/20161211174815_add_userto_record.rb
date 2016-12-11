class AddUsertoRecord < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :running
      t.text :lifting
      t.float :dqs
      t.text :code
      t.text :writing
      t.text :business

      t.timestamps
    end
    add_reference :records, :user, foreign_key: true
  end
end
