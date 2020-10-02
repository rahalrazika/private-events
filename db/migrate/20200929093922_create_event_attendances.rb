class CreateEventAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendances do |t|
      t.references :user, foreign_key: true
      t.references :event

      t.timestamps
    end
  end
end
