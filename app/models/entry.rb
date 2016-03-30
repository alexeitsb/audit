class Entry < ActiveRecord::Base
  has_many :attachments, dependent: :destroy
  belongs_to :user

  after_initialize :init

  enum entity: { credit: 1, debit: 2 }

  validates :description, presence: true, length: { in: 5..200 }


  private

  def init
    self.at = Date.today if self.at.blank?
  end
end
