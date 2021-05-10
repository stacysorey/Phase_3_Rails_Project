class Entry_Type < ApplicationRecord
  has_many :entries
  has_many :journals, through: :entries
end