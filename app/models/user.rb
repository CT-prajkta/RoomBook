class User < ActiveRecord::Base
  include Mongoid::Document
  field :username, type: String
  field :admin, type: Boolean
  field :password_digest, type: String
  has_many:meets
  validates :username, uniqueness:true, presence: true, length: {minimum: 3, maximum: 333}
  has_secure_password
  validates :password, length: { minimum: 5 }
end
