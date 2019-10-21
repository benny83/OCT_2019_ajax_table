class CreateInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table :insurances do |t|
      t.belongs_to :user
      t.belongs_to :company
      t.boolean :active
      t.boolean :business
      t.date :expiration
      t.float :price
    end
  end
end
