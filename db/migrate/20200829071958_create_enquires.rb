class CreateEnquires < ActiveRecord::Migration[6.0]
  def change
    create_table :enquires do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :offer
      t.text :notes
      t.references :domain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
