class Message < ApplicationRecord
  validates_presence_of :name, :content
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "It isn`t correct email" }
  validates :content, length: {minimum: 3}

  scope :search_by_name, ->(name) { where("lower(name) Like ?", "%#{name.downcase}%") }
  scope :search_by_content, ->(content) { where("lower(content) Like ?", "%#{content.downcase}%") }
  scope :admin_search, ->(arg) {search_by_name(arg).or search_by_content(arg)}
end