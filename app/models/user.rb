# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :orders
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api
  include DeviseTokenAuth::Concerns::User
end
