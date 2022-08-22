class Role < ApplicationRecord
  has_many :users

  enum name: {
    user: 0,
    admin: 1
  }
  validates :name, presence: true, uniqueness: true
end
