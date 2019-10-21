class Company < ApplicationRecord
  has_many :users, through: :insurances
  has_many :insurances
end
