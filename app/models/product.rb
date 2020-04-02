# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :orderproducts
  has_many :products, through: :orderproducts
  has_one_attached :image
end
