class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable
  
  validates :full_name, format: { with: /[A-Z][a-z] [A-Z][a-z]+/,
    message: "Name should have two capitalized words" }
end
