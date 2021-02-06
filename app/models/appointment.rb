class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def print_time 
    appointment_datetime.strftime("%B %d, %Y at %I:%M")
  end  
    

end
