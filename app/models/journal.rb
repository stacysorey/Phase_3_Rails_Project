class Journal < ApplicationRecord
  validates :title, presence: true
end