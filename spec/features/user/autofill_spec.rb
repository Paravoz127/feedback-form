require "rails_helper"

feature 'As User I want to see pre-filled name and email in feedback form' do
  scenario 'When I open New Feedback page' do
    user = User.create(full_name: 'John Smith', email: 'john@example.com', password: '12345678')
    login_as user

    visit root_path
    expect((page.find_by_id "email").value).to eq 'john@example.com'
    expect((page.find_by_id "name").value).to eq 'John Smith'
  end
end