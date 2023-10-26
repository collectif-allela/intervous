class Post < ApplicationRecord
  validates :cover_img_url, :published_at, :video_url , presence: true
  has_many :actualities
end
