class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :burden, :area, :day

  with_options presence: true do
    validates :image
    validates :content
    validates :info
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end

  validates :price, 
  presence: true, 
  numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' },
  inclusion: { in: 300..9999999, message: 'Out of setting range' }

end
