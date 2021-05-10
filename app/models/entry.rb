class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :journal
  has_many :entry_types
  validates :title, presence: true

  #do I need to include foreign key somewhere??

  scope :most_recent, -> { order created_at: :desc }
end