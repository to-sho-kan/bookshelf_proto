class Book
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :rentals

  field :title,      type: String
  field :author,     type: String
  field :publisher,  type: String
  field :issue_date, type: Date

  # TODO: 動作確認用に一旦コメントアウト(toku345)
  # validates :title, :author, :publisher, :issue_date, presence: true
end
