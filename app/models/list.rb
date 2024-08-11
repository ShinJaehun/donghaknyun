class List < ApplicationRecord
  validates :name, presence: true
  has_many :items

  belongs_to :schedule

  #include RankedModel
  #ranks :row_order
end
