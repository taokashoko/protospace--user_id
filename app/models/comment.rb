class Comment < ApplicationRecord
  belongs_to :prototype
  belongs_to :user
  belongs_to :prototype, dependent: :destroy
  validates :content, presence: true
end
