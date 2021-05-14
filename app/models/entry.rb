class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :journal
  belongs_to :entry_type
  validates :title, presence: true

  #do I need to include foreign key somewhere??

  scope :most_recent, -> { order created_at: :desc }

  scope :find_entry, -> { self.where("title LIKE ?", "%" + params[:q] + "%") }

end