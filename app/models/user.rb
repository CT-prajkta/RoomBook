class User
  include Mongoid::Document
  field :username, type: String
  field :admin, type: String
  validates :username, uniqueness:true, presence: true, length: {minimum: 3, maximum: 333}
end
