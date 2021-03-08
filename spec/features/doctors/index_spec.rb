require "rails_helper"

RSpec.describe 'Doctor index' do
  it "shows the all doctor attributes and they are listed by years practiced" do
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 11)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor3 = Doctor.create(name: "Alyssa", university: "Harvard", years_practiced: 8)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 25)
    visit doctors_path()
    expect(page).to have_content(doctor1.name)
    expect(page).to have_content(doctor2.name)
    expect(page).to have_content(doctor3.name)
    expect(page).to have_content(doctor4.name)
    expect(page).to have_content(doctor1.university)
    expect(page).to have_content(doctor2.university)
    expect(page).to have_content(doctor3.university)
    expect(page).to have_content(doctor4.university)
    expect(page).to have_content(doctor1.years_practiced)
    expect(page).to have_content(doctor2.years_practiced)
    expect(page).to have_content(doctor3.years_practiced)
    expect(page).to have_content(doctor4.years_practiced)
  end

  it "shows the doctors in order by years practiced" do
    doctor1 = Doctor.create(name: "Meridith", university: "Dartmouth", years_practiced: 11)
    doctor2 = Doctor.create(name: "Ryan", university: "Texas", years_practiced: 5)
    doctor3 = Doctor.create(name: "Alyssa", university: "Harvard", years_practiced: 8)
    doctor4 = Doctor.create(name: "Johnny", university: "Duke", years_practiced: 25)
      visit doctors_path()
      expect(doctor4.name).to appear_before(doctor1.name)
      expect(doctor1.name).to appear_before(doctor3.name)
      expect(doctor3.name).to appear_before(doctor2.name)
      expect(doctor4.name).to appear_before(doctor2.name)
  end
end
