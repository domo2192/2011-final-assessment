require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships and validations' do
    it {should have_many :doctor_surgeries}
    it {should have_many(:doctors).through(:doctor_surgeries)}
    it { should validate_presence_of :title}
    it { should validate_numericality_of :operating_room_number }
    it { should validate_presence_of :day_of_week }
  end
end
