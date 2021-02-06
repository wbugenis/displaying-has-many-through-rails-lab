class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  # validates :appointment_datetime, numericality: {greater_than: Time.now.to_i, message: "Pick a time later than now"}
  # validates :appointment_datetime, numericality: {less_than: (Time.now + 7.day).to_i, message: "Pick a time less than a week from now"}
  validates :doctor, inclusion: {in: Doctor.all}
  validates :appointment_datetime, presence: true

  def print_time 
    appointment_datetime.strftime("%B %d, %Y at %I:%M")
  end  


end
