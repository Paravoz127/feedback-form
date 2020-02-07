class Message < ApplicationRecord
  validates_presence_of :name, :content
  validates :name, format: { with: /[A-Z][a-z]+ [A-Z][a-z]+/,
    message: "Name should have two capitalized words" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "It isn`t correct email" }
  validates :content, length: {minimum: 10}

  scope :search_by_name, ->(name) { where("name Like ?", "%#{name}%") }
  scope :search_by_content, ->(content) { where("content Like ?", "%#{content}%") }
  scope :admin_search, ->(arg) {search_by_name(arg).or search_by_content(arg)}
end