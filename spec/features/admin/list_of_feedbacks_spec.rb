require "rails_helper"

feature 'As Admin User I want to see list of all Feedbacks' do
  scenario 'When I open Feedbacks page' do
    20.times do |i|
      Message.create(email: "mail#{i}@gmail.com", content: "message#{i}", name: "Person#{i}")
    end

    user = User.create(full_name: "Admin", email: "admin@example.com", admin: true, password: "12345678")
    login_as user

    visit messages_path

    expect(page).to have_content 'message19'
    expect(page).to have_content 'mail18@gmail.com'
    expect(page).to have_content 'Person17'
    expect(page).not_to have_content 'Person2'
    expect(page.find(:css, ".pagination")).not_to eq nil
  end
end