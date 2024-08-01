class Item < ApplicationRecord
  validates :body, presence: true

  belongs_to :list
  belongs_to :user
end
