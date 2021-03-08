require "rails_helper"

RSpec.describe 'Surgery show' do
  it "I see the surgery attributes" do
    surgery1 = Surgery.create(title: 'Tonsillectomy', day_of_week: 'Monday', operating_room_number: 113)
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 11)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 25)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor1.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor2.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor4.id)
      visit surgery_path(surgery1)
      expect(page).to have_content(surgery1.title)
      expect(page).to have_content(surgery1.day_of_week)
      expect(page).to have_content(surgery1.operating_room_number)

  end

  it "I see all the information of the doctors performing this surgery" do
    surgery1 = Surgery.create(title: 'Tonsillectomy', day_of_week: 'Monday', operating_room_number: 113)
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 11)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 25)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor1.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor2.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor4.id)
      visit surgery_path(surgery1)
      expect(page).to have_content(doctor1.name)
      expect(page).to have_content(doctor2.name)
      expect(page).to have_content(doctor4.name)
      expect(page).to have_content(doctor1.years_practiced)
      expect(page).to have_content(doctor2.years_practiced)
      expect(page).to have_content(doctor4.years_practiced)

  end

  it "I see a section of most and and least experienced doctors" do
    surgery1 = Surgery.create(title: 'Tonsillectomy', day_of_week: 'Monday', operating_room_number: 113)
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 11)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 25)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor1.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor2.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor4.id)
      visit surgery_path(surgery1)
      save_and_open_page
      within("#mostexperienced-") do
        expect(page).to have_content(doctor4.name)
        expect(page).to have_content(doctor4.years_practiced)
        expect(page).not_to have_content(doctor1.name)
        expect(page).not_to have_content(doctor2.name)
      end
      within("#leastexperienced-") do
        expect(page).to have_content(doctor2.name)
        expect(page).to have_content(doctor2.years_practiced)
        expect(page).not_to have_content(doctor4.name)
        expect(page).not_to have_content(doctor1.name)
      end
    end
end
