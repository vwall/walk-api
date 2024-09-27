class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  enum :role, { member: 0, walker: 1 }

  has_many :dogs, foreign_key: :owner_id, dependent: :destroy
  has_many :shifts, foreign_key: :walker_id, dependent: :destroy
  has_many :shift_assignments, through: :shifts

  validates :name, presence: true
  validates_inclusion_of :role, in: User.roles.keys

  validates :email,
            presence: true,
            uniqueness: {
              case_sensitive: false,
            },
            format: {
              with: Constants::REGEX_EMAIL,
              message: 'Invalid email address',
            }
end
