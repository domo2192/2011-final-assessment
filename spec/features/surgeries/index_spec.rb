require "rails_helper"

RSpec.describe 'Surgery index' do
  it "I see each surgery and its attributes" do
    surgery1 = Surgery.create(title: 'Tonsillectomy', day_of_week: 'Monday', operating_room_number: 113)
    surgery2 = Surgery.create(title: 'Double Bypass', day_of_week: 'Tuesday', operating_room_number: 114)
    surgery3 = Surgery.create(title: 'New Surgery', day_of_week: 'Monday', operating_room_number: 117)
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 10)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 20)
    doctor3 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 10)
    doctor5 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 2)
    doctor6 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 4)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor1.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor2.id)
    DoctorSurgery.create(surgery_id: surgery2.id, doctor_id: doctor4.id)
    DoctorSurgery.create(surgery_id: surgery2.id, doctor_id: doctor3.id)
    DoctorSurgery.create(surgery_id: surgery3.id, doctor_id: doctor5.id)
    DoctorSurgery.create(surgery_id: surgery3.id, doctor_id: doctor6.id)
    visit surgeries_path()
    expect(page).to have_content(surgery1.title)
    expect(page).to have_content(surgery2.title)
    expect(page).to have_content(surgery1.day_of_week)
    expect(page).to have_content(surgery2.day_of_week)
    expect(page).to have_content(surgery1.operating_room_number)
    expect(page).to have_content(surgery2.operating_room_number)
    expect(page).to have_content("Average Years Practiced of #{surgery1.title} is 7.5 years")
  end

  it "sorts the surguries by doctors experience" do
    surgery1 = Surgery.create(title: 'Tonsillectomy', day_of_week: 'Monday', operating_room_number: 113)
    surgery2 = Surgery.create(title: 'Double Bypass', day_of_week: 'Tuesday', operating_room_number: 114)
    surgery3 = Surgery.create(title: 'New Surgery', day_of_week: 'Monday', operating_room_number: 117)
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 10)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 20)
    doctor3 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 10)
    doctor5 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 2)
    doctor6 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 4)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor1.id)
    DoctorSurgery.create(surgery_id: surgery1.id, doctor_id: doctor2.id)
    DoctorSurgery.create(surgery_id: surgery2.id, doctor_id: doctor4.id)
    DoctorSurgery.create(surgery_id: surgery2.id, doctor_id: doctor3.id)
    DoctorSurgery.create(surgery_id: surgery3.id, doctor_id: doctor5.id)
    DoctorSurgery.create(surgery_id: surgery3.id, doctor_id: doctor6.id)
      visit surgeries_path()
      save_and_open_page
      expect(surgery2.title).to appear_before(surgery1.title)
      expect(surgery1.title).to appear_before(surgery3.title)
      expect(surgery2.title).to appear_before(surgery3.title)
  end
end
