class Item < ApplicationRecord

  belogs_to :user

  validates :name,                 presence: true
  validates :info,                 presence: true
  validates :category_id,          presence: true
  validates :item_status_id,       presence: true
  validates :fee_status_id,        presence: true
  validates :prefecture_id,        presence: true
  validates :delivery_schedule_id, presence: true
  validates :price,                presence: true
end
