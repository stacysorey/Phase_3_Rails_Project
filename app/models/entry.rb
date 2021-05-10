class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :journal
  validates :title, presence: true

  #do I need to include foreign key somewhere??

  scope :most_recent, -> { order created_at: :desc }
end