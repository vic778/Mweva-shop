class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  after_initialize :set_default_role

  validates :username, presence: true, uniqueness: true

  # def requires_confirmation?
  #   !confirmed?
  # end

  def update_role(role_name)
    self.role = Role.find_or_create_by(name: role_name)
    save
  end

  private

  def set_default_role
    self.role ||= Role.find_by(name: 'user')
  end
end
