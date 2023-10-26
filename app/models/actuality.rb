class Actuality < ApplicationRecord
  belongs_to :post
  has_many :comments
end
