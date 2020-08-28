class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :name, null: false
      t.string :title
      t.text :description
      t.string :status, null: false
      t.boolean :dns_linked, default: false
      t.text :head_scripts
      t.text :footer_scripts
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :domains, :name, unique: true
  end
end
