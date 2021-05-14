class Journal < ApplicationRecord
  belongs_to :user
  has_many :entries
  has_many :entry_types, through: :entries
  validates :title, presence: true

  #app/models/journal.rb
  scope :search, -> (query) { self.where("title LIKE ?", "%#{query}%") }

end