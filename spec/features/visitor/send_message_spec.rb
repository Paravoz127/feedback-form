require "rails_helper"

feature 'As Visitor I want to leave feedback' do
  scenario 'When I open New Feedback page' do
    visit root_path
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Content'
  end

  scenario 'When I fill all 3 fields and When I click "Submit feedback"' do
    User.create(full_name: "Admin", email: "admin@example.com", admin: true, password: "12345678")
    visit root_path

    name = 'Egor Letov'
    email = 'letov@gmail.com'
    content = 'ooooo'

    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :content, with: content


    click_on 'Submit feedback'

    expect(page).to have_content 'Feedback was successfully send!'
    expect(ActionMailer::Base.deliveries.first.to.first).to eq "admin@example.com"
  end
end