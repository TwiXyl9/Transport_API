# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :orders

  validates :name, :phone, presence: true, on: :create

  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api
  include DeviseTokenAuth::Concerns::User

  enum role: [:user,:admin]
  after_initialize :set_default_role, :if => :new_record?

  private
  def set_default_role
    self.role ||= :user
  end
end
