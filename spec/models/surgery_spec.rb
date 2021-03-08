require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships and validations' do
    it {should have_many :doctor_surgeries}
    it {should have_many(:doctors).through(:doctor_surgeries)}
    it { should validate_presence_of :title}
    it { should validate_numericality_of :operating_room_number }
    it { should validate_presence_of :day_of_week }
  end

  it "can show the most experienced and least experienced doctors" do
    surgery1 = Surgery.create(title: 'Tonsillectomy', day_of_week: 'Monday', operating_room_number: 113)
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 11)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 25)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor1.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor2.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor4.id)
    expect(surgery1.most_experienced).to eq(doctor4)
    expect(surgery1.least_experienced).to eq(doctor2)
  end
end
