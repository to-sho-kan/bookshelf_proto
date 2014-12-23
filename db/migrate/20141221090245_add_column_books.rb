class AddColumnBooks < ActiveRecord::Migration
  def change
    add_column :books, :publisher, :string
    add_column :books, :issue_date, :date
    add_column :books, :status, :integer
  end
end
