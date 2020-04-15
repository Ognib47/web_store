# frozen_string_literal: true

class Category < ApplicationRecord
  validates :description, :name, presence: true
  has_many :products
end
