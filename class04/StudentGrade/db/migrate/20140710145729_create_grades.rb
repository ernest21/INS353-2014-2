class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :subject_name
      t.integer :scrore
      t.string :subject_id

      t.timestamps
    end
  end
end
