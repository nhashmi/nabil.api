class ChangeRunningDetailsToRunningDetail < ActiveRecord::Migration
  def change
    rename_column :records, :running_detail, :running_details
  end
end
