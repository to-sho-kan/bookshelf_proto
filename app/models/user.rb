class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :rentals

  field :first_name, type: String
  field :last_name,  type: String
  field :memo,       type: String
end
