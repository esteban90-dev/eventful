class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :invitations
  has_many :attendees, through: :invitations

  validates :name, presence: true
  validates :location, presence: true
  validates :time, presence: true

  def self.past
    where("time < ?", Time.now)
  end

  def self.upcoming
    where("time > ?", Time.now)
  end
end
