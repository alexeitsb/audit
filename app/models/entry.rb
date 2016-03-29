class Entry < ActiveRecord::Base
  has_many :attachments

  belongs_to :user

  enum entity: { credit: 1, debit: 2 }

  validates :description, presence: true, length: { in: 5..200 }
  validates :value, numericality: { only_integer: false }
end
