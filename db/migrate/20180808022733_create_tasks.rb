class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :in_progress, default: false
      t.boolean :completion, default: false

      t.belongs_to :user
      t.timestamps
    end
  end
end
