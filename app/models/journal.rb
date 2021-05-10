class Journal < ApplicationRecord
  belongs_to :user
  has_many :entries
  has_many :entry_types, through: :entries
  validates :title, presence: true
end