class User < ApplicationRecord
  has_secure_password

  enum role: [ :admin, :level_1 ]
end
