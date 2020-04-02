# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :orderproducts
  has_many :products, through: :orderproducts
  belongs_to :users
end
