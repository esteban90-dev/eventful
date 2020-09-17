class User < ApplicationRecord
  has_secure_password

  has_many :hosted_events, foreign_key: "host_id", class_name: "Event", dependent: :destroy
  has_many :invitations, foreign_key: "attendee_id", dependent: :destroy
  has_many :attending_events, through: :invitations, source: "event"

  validates :name, presence: true
  validates :email, presence: true
end
