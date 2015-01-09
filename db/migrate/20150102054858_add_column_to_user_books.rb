class AddColumnToUserBooks < ActiveRecord::Migration
  def change
    add_column :user_books, :checkout_date, :Date
    add_column :user_books, :return_date, :Date
  end
end
