class Rental
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :book
  belongs_to :user

  field :checkout_date, type: Date
  field :return_date,   type: Date
end
