require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships and validations' do
    it {should have_many :doctor_surgeries}
    it {should have_many(:surgeries).through(:doctor_surgeries)}
    it { should validate_presence_of :name }
    it { should validate_numericality_of :years_practiced }
    it { should validate_presence_of :university }
  end

  it "it sorts doctors by years experienced" do
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 11)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor3 = Doctor.create(name: "Alyssa", university: "Harvard", years_practiced: 8)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 25)
    expect(Doctor.sort_by_years_experience).to eq([doctor4, doctor1, doctor3, doctor2])
  end
end
