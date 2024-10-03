class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.belongs_to :status
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
