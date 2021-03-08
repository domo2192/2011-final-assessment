class Doctor <ApplicationRecord
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries
  validates_presence_of :name
  validates_presence_of :university
  validates_numericality_of :years_practiced

end
