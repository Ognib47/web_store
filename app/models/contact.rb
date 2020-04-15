class Contact < ApplicationRecord
  validates :title, :email, :name, presence: true
end
