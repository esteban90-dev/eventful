class User < ApplicationRecord
  has_secure_password

  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  has_many :invitations, foreign_key: "attendee_id"
  has_many :attending_events, through: :invitations, source: "event"
end
