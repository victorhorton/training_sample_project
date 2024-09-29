class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }

  enum role: [ :admin, :level_1 ]
end
