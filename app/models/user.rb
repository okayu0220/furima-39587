class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,      format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} # 英数字混合
  validates :nickname,      presence: true
  validates :first_name_fw, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} # 全角の漢字・ひらがな・カタカナのみ許可
  validates :last_name_fw,  presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} # 全角の漢字・ひらがな・カタカナのみ許可
  validates :first_name_kn, presence: true, format: {with: /\A[ァ-ヶー]+\z/} # 全角のカタカナのみ許可
  validates :last_name_kn,  presence: true, format: {with: /\A[ァ-ヶー]+\z/} # 全角のカタカナのみ許可
  validates :birthday,      presence: true
end
