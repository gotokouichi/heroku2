class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  #EM_REGEX = /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/
  validates :email, presence: true#, format: { with: EM_REGEX }
  validates :email, uniqueness: true
  has_secure_password
  has_one :member_user
  has_one :group_user
  has_many :messages 
 
end
