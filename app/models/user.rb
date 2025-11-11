class User < ApplicationRecord
  # Include default devise modules. Others available are
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  enum :role, { student: 0, instructor: 1, admin: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum role: { student: 0, instructor: 1, admin: 2 }
  after_initialize :set_default_role, if: :new_record?
  has_many :courses, dependent: :destroy

  def set_default_role
    self.role ||= :student
  end
end
