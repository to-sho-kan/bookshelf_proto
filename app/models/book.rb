class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,      type: String
  field :author,     type: String
  field :publisher,  type: String
  field :issue_date, type: Date

  validates :title, :author, :publisher, :issue_date, presence: true
end
