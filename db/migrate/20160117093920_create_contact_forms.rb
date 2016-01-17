class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :email
      t.string :phone
      t.string :details

      t.timestamps null: false
    end
  end
end
