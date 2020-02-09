require "rails_helper"

feature 'As Admin User I want to search through feedbacks' do
  scenario 'When I open Feedbacks page' do
    init

    expect(page.find_by_id("search_input")).not_to eq nil
    expect(page.find_by_id("search")).not_to eq nil
  end

  scenario 'When I fill search input with "john"' do
    init

    fill_in :search_input, with: "john"
    click_on "search"

    expect(page).to have_content 'John Smith'
    expect(page).to have_content 'Hello'
    expect(page).to have_content 'john@example.com'

    expect(page).not_to have_content 'Michael Brown'
    expect(page).not_to have_content 'Help'
    expect(page).not_to have_content 'misha@example.com'
  end

  scenario 'When I fill search input with "Help"' do
    init

    fill_in :search_input, with: "Help"
    click_on "search"

    expect(page).not_to have_content 'John Smith'
    expect(page).not_to have_content 'Hello'
    expect(page).not_to have_content 'john@example.com'

    expect(page).to have_content 'Michael Brown'
    expect(page).to have_content 'Help'
    expect(page).to have_content 'misha@example.com'
  end
end



def init
  user = User.create(full_name: "Admin", email: "admin@example.com", admin: true, password: "12345678")
  login_as user
  Message.create(name: "John Smith", email: "john@example.com", content: "Hello")
  Message.create(name: "Michael Brown", email: "misha@example.com", content: "Help")
  visit messages_path
end