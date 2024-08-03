class List < ApplicationRecord
  validates :name, presence: true
  has_many :items

  #include RankedModel
  #ranks :row_order
end
