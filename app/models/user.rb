# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  extend Devise::Models
  before_save -> { skip_confirmation! }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
