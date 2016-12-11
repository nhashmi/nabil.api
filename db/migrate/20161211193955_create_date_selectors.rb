class CreateDateSelectors < ActiveRecord::Migration
  def change
    create_table :date_selectors do |t|

      t.timestamps null: false
    end
  end
end
