class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, index: { unique: true }, foreign_key: true
      t.string :name
      t.date :birthday
      t.integer :gender, default: 0, null: false
      t.string :school_name

      t.timestamps
    end
  end
end
