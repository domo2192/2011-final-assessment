require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships and validations' do
    it {should have_many :doctor_surgeries}
    it {should have_many(:surgeries).through(:doctor_surgeries)}
    it { should validate_presence_of :name }
    it { should validate_numericality_of :years_practiced }
    it { should validate_presence_of :university }
  end
end
