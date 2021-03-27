class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :area
  belongs_to :deliverydate
  has_one_attached :image

  with_options presence: true do
    validates :product_name,:commentary,:image
    validates :price, format: { with: /\A[0-9]+\z/},numericality: { greater_than: 300, less_than: 9999999 } 

    with_options numericality: { other_than: 1 } do
      validates :category_id,:status_id,:fee_id, :area_id,:deliverydate_id
    end    
  end
end
