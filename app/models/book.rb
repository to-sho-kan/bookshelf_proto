class Book < ActiveRecord::Base
  validates :title, :author, :publisher, :issue_date, :status, presence: true
end
