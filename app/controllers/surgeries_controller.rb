class SurgeriesController < ApplicationController
  def show
    @surgery = Surgery.find(params[:id])
    @doctors = @surgery.doctors
  end

  def update
    @surgery = Surgery.find(params[:id])
    find_doctor = Doctor.find_by_name(params[:name])
    @surgery.doctors << find_doctor
      redirect_to surgery_path(@surgery)
  end
end
