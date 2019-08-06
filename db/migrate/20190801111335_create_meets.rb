class CreateMeets < ActiveRecord::Migration[5.2]
  def change
    create_table :meets do |t|
      t.time :time_from
      t.time :time_to
      t.date :meet_date
      t.text :description
      t.string :subject
      t.references :room_no, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at      
      t.timestamps
    end
  end
end
