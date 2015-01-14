class RemoveStatusFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :status, :integer
  end
end
