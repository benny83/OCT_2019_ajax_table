class User < ApplicationRecord
  has_one :company, through: :insurance
  has_one :insurance

  scope :by_gender_filter, ->(option) { where(gender: option) }
  scope :by_company_filter, ->(company_name) { joins(:company).where(companies: { name: company_name }) }
  scope :by_active_filter, ->(status) { joins(:insurance).where(insurances: { active: status }) }

  def self.filter_by(options)
    result = all
    options.each do |filter, value|
      result = result.send("by_#{filter}_filter", value) if value.present?
    end
    result
  end
end
