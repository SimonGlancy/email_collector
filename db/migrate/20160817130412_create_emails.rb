class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :Address
      t.string :EmailType
      t.string :Event
      t.string :Timestamp

      t.timestamps
    end
  end
end
