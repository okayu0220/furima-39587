class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,      presence: true
  validates :first_name_fw, presence: true
  validates :last_name_fw,  presence: true
  validates :first_name_kn, presence: true
  validates :last_name_kn,  presence: true
  validates :birthday,      presence: true
end
