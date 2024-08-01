class Item < ApplicationRecord
  validates :body, presence: true

  belongs_to :list
  belongs_to :user

  include RankedModel
  ranks :row_order, with_same: :list_id
end
