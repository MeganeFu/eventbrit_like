class Event < ApplicationRecord
	
	validates :start_date, presence: true
  validate :future_event
	
private
  def future_event
   if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
  end
	end
  
	validates :duration, presence: true,  numericality: { only_integer: true, greater_than: 0 }
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 20..1000 }
	validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
	validates :location, presence: true
	belongs_to :user
	has_many :attendances
	
	 def event_send
    EventMailer.event_email(self).deliver_now
  end
end
	

