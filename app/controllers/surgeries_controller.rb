class SurgeriesController < ApplicationController
  def show
    @surgery = Surgery.find(params[:id])
    @doctors = @surgery.doctors 
  end
end
