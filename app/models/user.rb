class User < ActiveRecord::Base
  has_many :entries

  validates :username, presence: true, length: { in: 4..40 }, uniqueness: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  validates :name, presence: true, length: { in: 4..200 }

  enum role: { admin: 1, write: 2, read: 3 }

  default_scope { order(:name) }

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end
end
