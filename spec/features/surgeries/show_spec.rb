require "rails_helper"

RSpec.describe 'Surgery show' do
  it "I see the surgery attributes" do
    surgery1 = Surgery.create(title: 'Tonsillectomy', day_of_week: 'Monday', operating_room_number: 113)
      visit surgery_path(surgery1)
      expect(page).to have_content(surgery1.title)
      expect(page).to have_content(surgery1.day_of_week)
      expect(page).to have_content(surgery1.operating_room_number)

  end
end
