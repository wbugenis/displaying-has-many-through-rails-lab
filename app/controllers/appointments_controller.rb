class AppointmentsController < ApplicationController

    def show
        @appointment = Appointment.find(params[:id])
    end

    def new 
        @appointment = Appointment.new
    end 
    
    def create
        @appointment = Appointment.create(appointment_params)
        if @appointment.valid?
            redirect_to appointment_path(@appointment)
        else 
            flash[:errors] = @appointment.errors.full_messages
            redirect_to new_appointment_path
        end
    end    

    def edit
        @appointment = Appointment.find(params[:id])
    end 
    
    def update
        @appointment = Appointment.find(params[:id])
        @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
    end 
    
    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect_to patient_path(@appointment.patient_id)
    end    


        private

    def appointment_params
        params.require(:appointment).permit(:appointment_datetime, :patient_id, :doctor_id)    
    end


end