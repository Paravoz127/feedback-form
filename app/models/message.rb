class Message < ApplicationRecord
  include PgSearch

  pg_search_scope :admin_search, against: [:name, :content]

  validates_presence_of :name, content
  validates :name, format: { with: /[A-Z][a-z] [A-Z][a-z]+/,
    message: "Name should have two capitalized words" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "It isn`t correct email" }
  validates :content, length: {minimum: 10}

end