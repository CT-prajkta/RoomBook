class User < ApplicationRecord
  include Mongoid::Document
  field :username, type: String
  field :admin, type: Boolean
  field :password_digest, type: String
  has_many:meets, dependent: :destroy
  validates :username, presence: true, uniqueness:true, length: {minimum: 3, maximum: 333}
  has_secure_password
  validates :password, length: { minimum: 5 }
end
