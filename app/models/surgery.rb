class Surgery <ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries
  validates_presence_of :title
  validates_presence_of :day_of_week
  validates_numericality_of :operating_room_number


  def most_experienced
    doctors.order(years_practiced: :desc).max
  end

  def least_experienced
    doctors.order(years_practiced: :desc).last
  end

end
