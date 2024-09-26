class Dog < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true
end
