class Event < ApplicationRecord
	
	 validates :start_date, :presence => { :message => "must be a valid date/time" }
  validates :end_date, :presence => {:message => "must be a valid date/time"}
  validate :start_must_be_before_end_date

  def start_must_be_before_end_date
    errors.add(:start_date, "must be before end date") unless
       start_date > end_date
  end 
	validates :duration, presence: true,  numericality: { only_integer: true, greater_than: 0 }
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 20..1000 }
	validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
	validates :location, presence: true
	belongs_to :user
end
