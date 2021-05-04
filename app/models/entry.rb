class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :journal
  validates :title, presence: true
end