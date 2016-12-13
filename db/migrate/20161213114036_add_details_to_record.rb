class AddDetailsToRecord < ActiveRecord::Migration
  def change
    add_column :records, :running_detail, :text
    add_column :records, :lifting_details, :text
    add_column :records, :code_details, :text
    add_column :records, :writing_details, :text
    add_column :records, :business_details, :text
    add_column :records, :citizenship_details, :text
    add_column :records, :reading_details, :text
    add_column :records, :work_details, :text
    add_column :records, :bored_details, :text
    add_column :records, :diy_details, :text
  end
end
