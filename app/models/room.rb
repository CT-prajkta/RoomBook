#require 'spec_helper'
class Room < ActiveRecord::Base
    include Mongoid::Document
    field :room_no, type: Integer
    field :capacity, type: Integer
    #has_many :meets, dependent: :destroy
    validates :room_no,  presence: true, uniqueness:true, length: {minimum: 1, maximum: 3}
    validates :capacity,presence: true, length: {minimum: 1, maximum: 100}
end
  