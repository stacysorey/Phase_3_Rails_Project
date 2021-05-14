class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :journal
  belongs_to :entry_type
  validates :title, presence: true

end