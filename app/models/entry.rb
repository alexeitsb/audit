class Entry < ActiveRecord::Base
  has_many :attachments, dependent: :destroy
  belongs_to :user
  belongs_to :responsible, class_name: "User"

  after_initialize :init

  enum entity: { credit: 1, debit: 2 }

  validates :description, presence: true, length: { in: 4..200 }

  scope :by_user_id, -> (user_id) { where("user_id = #{user_id}") }
  scope :by_responsible_id, -> (responsible_id) { where("responsible_id = #{responsible_id}") }
  scope :by_beginning_date, -> (beginning_date) { where("at >= ?", Date.parse(beginning_date)) }
  scope :by_end_date, -> (end_date) { where("at <= ?", Date.parse(end_date)) }


  private

  def init
    self.at = Date.today if self.at.blank?
  end
end
