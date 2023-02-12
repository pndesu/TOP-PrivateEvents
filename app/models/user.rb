class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy
  has_many :invitations, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :invitations

  validates :username, presence: true, uniqueness: true, length: {in: 6..20}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true, length: {in: 6..20}

  scope :not_invited, -> {where.not(id: current_user.id).where}
end
