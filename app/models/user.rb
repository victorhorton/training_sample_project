class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 8 }, confirmation: true, if: :password_changing
  validates :password_confirmation, presence: true, if: :password_changing

  before_create :set_default_role

  enum role: [ :admin, :level_1 ]

  private

  def password_changing
    self.password.present?
  end

  def set_default_role
    if role.nil?
      self.role = :level_1
    end
  end
end
