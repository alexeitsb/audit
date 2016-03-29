class User < ActiveRecord::Base
  has_many :entries

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
