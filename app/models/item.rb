class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :delivery_schedule

  validates :image,                presence: true
  validates :name,                 presence: true
  validates :info,                 presence: true
  validates :category_id,          presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :item_status_id,       presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :fee_status_id,        presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :prefecture_id,        presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :delivery_schedule_id, presence: true, numericality: {other_than: 0, message: "can't be blank"}
  validates :price,                presence: true
end
