class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.sort_by_years_experience
  end
end
